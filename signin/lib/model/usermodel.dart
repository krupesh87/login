import 'package:firebase_auth/firebase_auth.dart';

class UserModel{
  String?uid;
  String?name;
  String?email;
  String?password;
  String?confirm;


  UserModel({this.uid,this.name,this.email,this.password,this.confirm});

  factory UserModel.fromMap(map){
    return UserModel(
      uid: map['uid'],
      name: map['name'],
      email: map['email'],
      password: map['password'],
      confirm: map['confirm']
    );
  }

  Map<String,dynamic> toMap(){
    return {
      'uid':uid,
      'name':name,
      'email':email,
      'password':password,
      'confirm':confirm
    };
  }
}