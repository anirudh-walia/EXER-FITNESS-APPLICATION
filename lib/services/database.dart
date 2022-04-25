import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_learning/models/user.dart';
import 'package:flutter_app_learning/models/userss.dart';
class DatabaseService{

  final String uid;
  DatabaseService({this.uid});
  // collection reference

  final CollectionReference dataCollection = Firestore.instance.collection('userdata');

  Future updateUserData(String name, String gender, int age, int height_feet, int height_inches, int weight) async {
    return await dataCollection.document(uid).setData({
      'name': name,
      'gender' : gender,
      'age' : age,
      'height_feet' : height_feet,
      'height_inches' : height_inches,
      'weight' : weight,
    });
  }
  // user list from snapshot

  List<Userss> _userListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.documents.map((doc){
      return Userss(
        name: doc.data['name'] ?? " ",
        gender: doc.data['gender'] ?? " ",
        age : doc.data['age'] ?? 0,
        height_feet : doc.data['height_feet'] ?? 0,
        height_inches: doc.data['height_inches'] ?? 0,
        weight : doc.data['weight'] ?? 0,
      );
    }).toList();
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot){
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      gender: snapshot.data['gender'],
      age: snapshot.data['age'],
      weight: snapshot.data['weight'],
      height_feet: snapshot.data['height_feet'],
      height_inches: snapshot.data['height_inches'],
    );
  }

  // get streams
  Stream<List<Userss>> get usersdata{
    return dataCollection.snapshots()
    .map(_userListFromSnapshot);
}

  Stream<UserData> get userData{
    return dataCollection.document(uid).snapshots()
    .map(_userDataFromSnapshot);
  }
}