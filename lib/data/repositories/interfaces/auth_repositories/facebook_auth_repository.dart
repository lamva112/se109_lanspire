import 'package:dartz/dartz.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../../../../constants.dart';
import '../../../../core/core.dart';
import '../../../data.dart';

abstract class IFacebookAuthRepository {
  Future<Either<Failure, AuthResponse?>> signInWithFacebook({
    List<String> permissions = fbPermissions,
    LoginBehavior loginBehavior = LoginBehavior.nativeWithFallback,
  });

  Future<Either<Failure, AuthResponse?>> get getCurrentFacebookToken;

  Future<Either<Failure, AuthResponse?>> get isUserSignedInWithFacebook;

  Future<Either<Failure, void>> signOutFacebookAccount();

  Future<Either<Failure, AuthResponse?>> getFacebookUserData({String fields = fbFields});
}
