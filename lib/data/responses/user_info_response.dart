import '../data.dart';

class UserInfoResponse {
  UserModel? user;

  UserInfoResponse({this.user});

  UserInfoResponse.fromJson(Map<String, dynamic> json) {
    if (json['user'] != null) {
      user = UserModel.fromJson(Map.from(json['user']));
    }
  }

  Map<String, dynamic> toJson() {
    var data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }

    return data;
  }
}
