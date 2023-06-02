import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../data.dart';

class AuthResponse {
  dynamic data; // Temp
  AuthErrorModel? authError;
  bool? isUserSignedInWithFacebook;
  Map<String, dynamic>? facebookUserData;
  User? facebookSignInResult;
  AccessToken? facebookToken;
  User? googleAccount;
  bool? isUserSignedInWithGoogle;
  bool? isUserSignedInWithPhone;
  UserModel? user;
  User? firebaseUser;

  AuthResponse({
    this.isUserSignedInWithFacebook,
    this.facebookUserData,
    this.facebookSignInResult,
    this.facebookToken,
    this.googleAccount,
    this.isUserSignedInWithGoogle,
    this.isUserSignedInWithPhone,
    this.user,
    this.firebaseUser,
  });

  AuthResponse.fromJson(Map<String, dynamic> json) {
    data = json[data];
    authError = json['error'] != null ? AuthErrorModel.fromJson(json['error']) : null;
  }

  Map<String, dynamic> toJson() {
    final d = <String, dynamic>{};

    d['data'] = data;
    if (authError != null) {
      d['error'] = authError!.toJson();
    }

    return d;
  }
}
