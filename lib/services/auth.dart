import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:http/http.dart' as http;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hugsmobileapp/services/database.dart';

//Handles user authentication

class AuthService {

  //final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //auth change stream, triggered upon change in authentication
  //value object either FirebaseUser or null
  Stream<FirebaseUser> get user {
    return _auth.onAuthStateChanged;
  }

  Future getUserId() async {
    final FirebaseUser user = await _auth.currentUser();
    if (user != null) {
      final uid = user.uid;
      return uid;
    } else {
      print('curr user is null');
    }
  }

  //register up with email and password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;

      //create a new document for the user with the uid
      DatabaseService(uid: user.uid).createNewDocument();
      return { 'user': user };
    } catch (error) {
      print(error.toString());
      return { 'user': null, 'error': error.message };
    }
  }

  //login in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return { 'user': user };
    } catch (error) {
      print(error.toString());
      return { 'user': null, 'error': error.message };
    }
  }

  //login with facebook
  void signInWithFacebook() async {
    FacebookLogin facebookLogin = FacebookLogin();

    final result = await facebookLogin.logIn(['email']);

    if (result.status == FacebookLoginStatus.loggedIn) {
      final token = result.accessToken.token;
      final graphResponse = await http.get(
          'https://graph.facebook.com/v2.12/me?fields=name,first_name,last_name,email&access_token=${token}');
      //final profile = JSON.decode(graphResponse.body);
      print(graphResponse.body);
      final credential = FacebookAuthProvider.getCredential(accessToken: token);
      AuthResult res = await _auth.signInWithCredential(credential);
      FirebaseUser user = res.user;
      DatabaseService(uid: user.uid).createNewDocument();
    }
  }

  Future<void> signInWithGoogle() async {
    try {
      //GoogleSignIn _googleSignIn = new GoogleSignIn();
      GoogleSignIn _googleSignIn = GoogleSignIn(
        scopes: [
          'email',
          'https://www.googleapis.com/auth/contacts.readonly',
        ],
      );

      GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

      AuthCredential credential = GoogleAuthProvider.getCredential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);

      AuthResult result = (await _auth.signInWithCredential(credential));
      FirebaseUser user = result.user;
      DatabaseService(uid: user.uid).createNewDocument();
      print(result.user);
    } catch (error) {
      print(error.toString());
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(error) {
      print(error.toString());
      return null;
    }
  }

  Future resetPassword(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } catch (error) {
      print(error.toString());
    }
  }

}