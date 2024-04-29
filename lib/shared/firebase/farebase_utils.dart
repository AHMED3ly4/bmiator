import 'package:bmiator/auth/data/models/bmi_model.dart';
import 'package:bmiator/auth/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseUtils{
  static CollectionReference<UserModel> getUsersCollection()=>
      FirebaseFirestore.instance.collection("users").withConverter(
          fromFirestore: (snapshot, options) => UserModel.fromJson(snapshot.data()!),
          toFirestore: (user, options) => user.toJson(),
      );

  static CollectionReference<BMIModel> getBMICollection(String userId)=>
      getUsersCollection().doc(userId).collection("BMIs").withConverter(
          fromFirestore: (snapshot, options) => BMIModel.fromJson(snapshot.data()!),
          toFirestore: (bmi, options) => bmi.toJson(),
      );

  static Future<UserModel> register(String name,String email, String password) async {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
    final userCollection = getUsersCollection();
    final user = UserModel(id: credential.user!.uid, name: name, email: email);
    await userCollection.doc(user.id).set(user);
    return user;
  }

  static Future<UserModel> login(String email,String password) async {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
    );
    final userCollection = getUsersCollection();
    final docSnapshot = await userCollection.doc(credential.user!.uid).get();
    return docSnapshot.data()!;
  }

  static Future<void> logout() async {
    return FirebaseAuth.instance.signOut();
  }


  static Future<void> addBMI (String userId,BMIModel bmi) async {
    final bmiCollection =getBMICollection(userId);
    final doc = bmiCollection.doc();
    bmi.id = doc.id;
    return doc.set(bmi);
  }

  static Future<void> deleteBMI (String userId,String bmiId) async {
    final bmiCollection =getBMICollection(userId);
    final doc = bmiCollection.doc(bmiId);
    return doc.delete();
  }
  static Future<void> editBMI (String userId,BMIModel bmi) async {
    final bmiCollection =getBMICollection(userId);
    final doc = bmiCollection.doc(bmi.id);
    return doc.set(bmi);
  }

  static Future<List<BMIModel>?> getBMIs(String userId,[DateTime? lastBmiDate]) async {
    final bmiCollection = getBMICollection(userId).orderBy("date",descending: true).where("date",isLessThan: lastBmiDate != null ? Timestamp.fromDate(lastBmiDate): null).limit(10);
    final querySnapshots = await bmiCollection.get();
    return querySnapshots.docs.map((snapshot) => snapshot.data()).toList();
  }

}