import 'package:dartz/dartz.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:se109_lanspire/data/responses/user_info_response.dart';

import '../../constants.dart';
import '../../core/core.dart';
import '../data.dart';

class AuthRepository implements IAuthRepository {
  final INetworkInfo networkInfo;
  final IAuthRemoteService authRemoteService;

  AuthRepository({required this.networkInfo, required this.authRemoteService});

  /// Auth handler methods
  @override
  Future<Either<Failure, void>> signInWithPhoneNumber({required String phoneNumber}) async {
    final isConnected = await networkInfo.isConnected;
    try {
      if (isConnected) {
        var res = await authRemoteService.signInWithPhoneNumber(phoneNumber: phoneNumber);
        return Right(res);
      }
      return Right(null);
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, void>> signOut() async {
    final isConnected = await networkInfo.isConnected;
    try {
      if (isConnected) {
        var res = await authRemoteService.signOut();
        return Right(res);
      }
      return Right(null);
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      print("respository ${e}");
      return Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, void>> forgotPassword({required String phoneNumber}) async {
    final isConnected = await networkInfo.isConnected;
    try {
      if (isConnected) {
        var res = await authRemoteService.forgotPassword(phoneNumber: phoneNumber);
        return Right(res);
      }
      return Right(null);
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, void>> otpVerification({required String otp}) async {
    final isConnected = await networkInfo.isConnected;
    try {
      if (isConnected) {
        var res = await authRemoteService.otpVerification(otp: otp);
        return Right(res);
      }
      return Right(null);
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, void>> resetPassword({required String newPassword, required String confirmedPassword}) async {
    final isConnected = await networkInfo.isConnected;
    try {
      if (isConnected) {
        var res = await authRemoteService.resetPassword(newPassword: newPassword, confirmedPassword: confirmedPassword);
        return Right(res);
      }
      return Right(null);
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, void>> signUpWithPhoneNumber({required String phoneNumber}) async {
    final isConnected = await networkInfo.isConnected;
    try {
      if (isConnected) {
        var res = await authRemoteService.signUpWithPhoneNumber(phoneNumber: phoneNumber);
        return Right(res);
      }
      return Right(null);
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(UnknownFailure());
    }
  }

  /// Facebook auth handler methods
  @override
  Future<Either<Failure, AuthResponse?>> get getCurrentFacebookToken async {
    final isConnected = await networkInfo.isConnected;
    try {
      if (isConnected) {
        var res = await authRemoteService.getCurrentFacebookToken;
        return Right(res);
      }
      return Right(null);
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, AuthResponse?>> getFacebookUserData({String fields = fbFields}) async {
    final isConnected = await networkInfo.isConnected;
    try {
      if (isConnected) {
        var res = await authRemoteService.getFacebookUserData(fields: fields);
        return Right(res);
      }
      return Right(null);
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, AuthResponse?>> get isUserSignedInWithFacebook async {
    final isConnected = await networkInfo.isConnected;
    try {
      if (isConnected) {
        var res = await authRemoteService.isUserSignedInWithFacebook;
        return Right(res);
      }
      return Right(null);
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, void>> signOutFacebookAccount() async {
    final isConnected = await networkInfo.isConnected;
    try {
      if (isConnected) {
        var res = await authRemoteService.signOutFacebookAccount();
        return Right(res);
      }
      return Right(false);
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, AuthResponse?>> signInWithFacebook({
    List<String> permissions = fbPermissions,
    LoginBehavior loginBehavior = LoginBehavior.nativeWithFallback,
  }) async {
    final isConnected = await networkInfo.isConnected;
    try {
      if (isConnected) {
        var res = await authRemoteService.signInWithFacebook(permissions: permissions, loginBehavior: loginBehavior);
        return Right(res);
      }
      return Right(null);
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(UnknownFailure());
    }
  }

  /// Google auth handler methods
  @override
  Future<Either<Failure, AuthResponse?>> get getCurrentGoogleAccount async {
    final isConnected = await networkInfo.isConnected;
    try {
      if (isConnected) {
        var res = await authRemoteService.getCurrentGoogleAccount;
        return Right(res);
      }
      return Right(null);
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, AuthResponse?>> get isUserSignedInWithGoogle async {
    final isConnected = await networkInfo.isConnected;
    try {
      if (isConnected) {
        var res = await authRemoteService.isUserSignedInWithGoogle;
        return Right(res);
      }
      return Right(null);
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, AuthResponse?>> signInWithGoogle() async {
    final isConnected = await networkInfo.isConnected;
    try {
      if (isConnected) {
        var res = await authRemoteService.signInWithGoogle();
        return Right(res);
      }
      return Right(null);
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, AuthResponse?>> signInWithGoogleSilently({
    bool suppressErrors = true,
    bool reAuthenticate = false,
  }) async {
    final isConnected = await networkInfo.isConnected;
    try {
      if (isConnected) {
        var res = await authRemoteService.signInWithGoogleSilently(
          suppressErrors: suppressErrors,
          reAuthenticate: reAuthenticate,
        );
        return Right(res);
      }
      return Right(null);
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, AuthResponse?>> signOutGoogleAccount() async {
    final isConnected = await networkInfo.isConnected;
    try {
      if (isConnected) {
        var res = await authRemoteService.signOutGoogleAccount();
        return Right(res);
      }
      return Right(null);
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(UnknownFailure());
    }
  }

  @override
  AuthResponse get firebaseCurrentUser => authRemoteService.firebaseCurrentUser;

  @override
  Future<Either<Failure, UserInfoResponse?>> signInWithEmailAndPassword({required String email, required String password}) async {
    final isConnected = await networkInfo.isConnected;
    try {
      if (isConnected) {
        var res = await authRemoteService.signInWithEmail(email: email, password: password);
        print("respository ${res}");
        return Right(res);
      }
      return Right(null);
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      print("respository loi ${e}");
      return Left(UnknownFailure());
    }
  }
}
