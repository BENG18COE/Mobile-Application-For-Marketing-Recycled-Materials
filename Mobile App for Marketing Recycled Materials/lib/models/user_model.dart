import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? uid;
  bool? isVerified;
  final String? email;
  String? password;
  final String? displayName;
  final int? age;
  final String? userCategory;
  UserModel({
    this.uid,
    this.email,
    this.password,
    this.displayName,
    this.age,
    this.isVerified,
    this.userCategory,
  });

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'displayName': displayName,
      'age': age,
      'userCategory': userCategory,
    };
  }

  UserModel.fromDocumentSnapshot(DocumentSnapshot<Map<String, dynamic>> doc)
      : uid = doc.id,
        email = doc.data()!["email"],
        age = doc.data()!["age"],
        displayName = doc.data()!["displayName"],
        userCategory = doc.data()!["userCategory"];

  UserModel copyWith({
    bool? isVerified,
    String? uid,
    String? email,
    String? password,
    String? displayName,
    int? age,
    String? userCategory,
  }) {
    return UserModel(
        uid: uid ?? this.uid,
        email: email ?? this.email,
        password: password ?? this.password,
        displayName: displayName ?? this.displayName,
        age: age ?? this.age,
        userCategory: userCategory ?? this.userCategory,
        isVerified: isVerified ?? this.isVerified);
  }
}
