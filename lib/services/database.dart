import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hugsmobileapp/pages/helper/helperFunctions.dart';
import '../pages/helper/helperFunctions.dart';
import '../pages/helper/constants.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DatabaseService {

  final String uid;
  DatabaseService({ this.uid });

  // collection reference
  final CollectionReference userCollection = Firestore.instance.collection('users');

  Future setUserData(String username) async {
    return await userCollection.document(uid).setData({
      'username': username
    });
  }

  Future updateUserData(String username) async {
    return await userCollection.document(uid).updateData({
      'username': username
    });
  }

  Future updateUserEmail(String email) async {
    return await userCollection.document(uid).updateData({
      'email': email
    });
  }

  Future updateUserProfilePic(String profilePic) async {
    return await userCollection.document(uid).updateData({
      'profilePic': profilePic
    });
  }

  Future updateUserBio(String bio) async {
    return await userCollection.document(uid).updateData({
      'bio': bio
    });
  }

  Future updateUserAchievements(List achievements) async {
    return await userCollection.document(uid).updateData({
      'achievements': achievements
    });
  }

  Stream<QuerySnapshot> get user {
    return userCollection.snapshots();
  }

  createEmailDoc(String email) async {
    await DatabaseService(uid: uid).updateUserEmail(email);
  }

  createNewDocument() async {
    await DatabaseService(uid: uid).setUserData('Your username');
    await HelperFunctions.saveUsername('Your username');
  }

  getUserIdByUsername(String username) async {
    print(username);
    QuerySnapshot qs = await Firestore.instance.collection('users')
        .where('username', isEqualTo: username)
        .getDocuments();
    return qs.documents[0].documentID;
  }

  getUsernameByUserEmail(String userEmail) async {
     QuerySnapshot qs = await userCollection
        .where('email', isEqualTo: userEmail)
         .getDocuments();
     return qs.documents[0]['username'];
  }

  getUsernameByUid(String uid) async {
    return await userCollection
        .document(uid)
        .get() //get a Document Reference
        .then((documentSnapshot) =>
           documentSnapshot['username']
        );
  }

  createChatRoom(String charRoomId, chatRoomMap) {
    Firestore.instance.collection('chatRoom')
        .document(charRoomId).updateData(chatRoomMap).catchError((e) {
      print(e.toString());
    });
  }

  openChatRoom(String charRoomId, chatRoomMap) {
    Firestore.instance.collection('chatRoom')
        .document(charRoomId).setData(chatRoomMap).catchError((e) {
      print(e.toString());
    });
  }

  getMessages(String chatRoomId) async{
    return await Firestore.instance
        .collection("chatRoom")
        .document(chatRoomId)
        .collection("chats")
        .orderBy('time')
        .snapshots();
  }

  getChats(String uid) async {
    return await Firestore.instance
        .collection("chatRoom")
        .where('users', arrayContains: uid)
        .snapshots();
  }

  Future<void> addMessage(String chatRoomId, chatMessageData, message){
    Firestore.instance.collection("chatRoom")
        .document(chatRoomId)
        .collection("chats")
        .add(chatMessageData).catchError((e){
      print(e.toString());
    });

    Firestore.instance.collection("chatRoom")
        .document(chatRoomId)
        .updateData({ 'lastMessage': message }).catchError((e){
      print(e.toString());
    });

  }

  Future<String> saveImageInChatRoomStorage(croppedFile,chatID) async {
    try {
      String imageTimeStamp = DateTime.now().millisecondsSinceEpoch.toString();
      String filePath = 'chatrooms/$chatID/$imageTimeStamp';
      final StorageReference storageReference = FirebaseStorage().ref().child(filePath);
      final StorageUploadTask uploadTask = storageReference.putFile(croppedFile);
      StorageTaskSnapshot storageTaskSnapshot = await uploadTask.onComplete;
      String result = await storageTaskSnapshot.ref.getDownloadURL();
      return result;
    }catch(e) {
      print(e.message);
    }
  }

  getUserChats(String myName) async {
    return await Firestore.instance
        .collection("chatRoom")
        .where('users', arrayContains: myName)
        .snapshots();
  }
}


