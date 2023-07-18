import 'package:se109_lanspire/data/models/user_models/roles_model.dart';

import '../../../extensions/extensions.dart';

import '../../../enums.dart';
import '../../data.dart';

class UserModel {
  String? idUser;
  String? username;
  String? password;
  String? displayName;
  String? email;
  int? gender;
  String? phoneNumber;
  String? imageUrl;
  List<String>? address;
  String? dob;
  String? idRole;
  bool? isActivated;
  Role? role;


  UserModel(
      {this.idUser,
        this.username,
        this.password,
        this.displayName,
        this.email,
        this.gender,
        this.phoneNumber,
        this.imageUrl,
        this.address,
        this.dob,
        this.idRole,
        this.isActivated,
        this.role});

  UserModel.fromJson(Map<String, dynamic> json) {
    idUser = json['idUser'];
    username = json['username'];
    password = json['password'];
    displayName = json['displayName'];
    email = json['email'];
    gender = json['gender'];
    phoneNumber = json['phoneNumber'];
    imageUrl = json['imageUrl'];
    address = json['address'].cast<String>();
    if(json['dob'] != null && json['dob'] is String){
      String convertValue = json['dob'];
      dob = convertValue.covertToAppDateTime();
    }
    idRole = json['idRole'];
    isActivated = json['isActivated'];
    role = json['Role'] != null ?  Role.fromJson(json['Role']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['idUser'] = this.idUser;
    data['username'] = this.username;
    data['password'] = this.password;
    data['displayName'] = this.displayName;
    data['email'] = this.email;
    data['gender'] = this.gender;
    data['phoneNumber'] = this.phoneNumber;
    data['imageUrl'] = this.imageUrl;
    data['address'] = this.address;
    data['dob'] = this.dob;
    data['idRole'] = this.idRole;
    data['isActivated'] = this.isActivated;
    if (this.role != null) {
      data['Role'] = this.role!.toJson();
    }
    return data;
  }

  UserModel copyWith({String? phoneNumber,String? dob,String? email,List<String>? address}){
    return UserModel(
      idUser:this.idUser,
      username: this.username,
      password: this.password,
      displayName: this.displayName,
      email: email??this.email,
      gender: this.gender,
      phoneNumber: phoneNumber??this.phoneNumber,
      imageUrl: this.imageUrl,
      address: address ??this.address,
      dob: dob ??this.dob,
      isActivated: this.isActivated,
      idRole: this.idRole,
    );
  }
}