import '../data.dart';

class UserInfoResponse {
  UserModel? user;
  String? accessToken;
  String? refreshToken;

  UserInfoResponse({this.user, this.accessToken, this.refreshToken});

  UserInfoResponse.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ?  UserModel.fromJson(json['user']) : null;
    accessToken = json['accessToken'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['accessToken'] = this.accessToken;
    data['refreshToken'] = this.refreshToken;
    return data;
  }
}
