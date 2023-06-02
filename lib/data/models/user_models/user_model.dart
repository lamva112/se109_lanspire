import '../../../extensions/extensions.dart';

import '../../../enums.dart';
import '../../data.dart';

class UserModel {
  SettingModel? setting;
  String? id;
  String? email;
  String? phoneNumber;
  String? name;
  ImageModel? image;
  int? points;
  String? birthDay;
  Gender? gender;

  UserModel({
    this.setting,
    this.id,
    this.email,
    this.phoneNumber,
    this.name,
    this.image,
    this.points,
    this.birthDay,
    this.gender,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    setting = json['setting'] != null ? SettingModel.fromJson(Map.from(json['setting'])) : null;
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    image = json['image'] != null ? ImageModel.fromJson(Map.from(json['image'])) : null;
    birthDay = json['birthDay'];
    if(json['gender'] != null && json['gender'] is String){
      String convertValue = json['gender'];
      gender = convertValue.convertToGenderEnum();
    }
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    if (setting != null) {
      data['setting'] = setting!.toJson();
    }
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phoneNumber'] = phoneNumber;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    data['birthDay'] = birthDay;
    data['gender'] = gender;
    return data;
  }

  UserModel copyWith({
    SettingModel? setting,
    String? id,
    String? email,
    String? phoneNumber,
    String? name,
    ImageModel? image,
  }) {
    return UserModel(
      setting: setting ?? this.setting,
      id: id ?? this.id,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }
}
