import 'package:dartz/dartz.dart';
import 'package:se109_lanspire/data/responses/user_info_response.dart';

import '../../../../core/core.dart';
import '../../../data.dart';

abstract class IAuthRepository implements IFacebookAuthRepository, IGoogleAuthRepository {
  Future<Either<Failure, void>> signInWithPhoneNumber({required String phoneNumber});

  Future<Either<Failure, void>> signOut();

  Future<Either<Failure, void>> signUpWithPhoneNumber({required String phoneNumber});

  Future<Either<Failure, void>> forgotPassword({required String phoneNumber});

  Future<Either<Failure, void>> otpVerification({required String otp});

  Future<Either<Failure, void>> resetPassword({required String newPassword, required String confirmedPassword});

  AuthResponse get firebaseCurrentUser;

  Future<Either<Failure, UserInfoResponse?>> signInWithEmailAndPassword({required String email,required String password});
}
