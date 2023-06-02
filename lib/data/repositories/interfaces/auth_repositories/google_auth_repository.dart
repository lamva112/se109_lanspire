import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../../data.dart';

abstract class IGoogleAuthRepository {
  Future<Either<Failure, AuthResponse?>> signInWithGoogle();

  Future<Either<Failure, AuthResponse?>> signOutGoogleAccount();

  Future<Either<Failure, AuthResponse?>> get getCurrentGoogleAccount;

  Future<Either<Failure, AuthResponse?>> get isUserSignedInWithGoogle;

  Future<Either<Failure, AuthResponse?>> signInWithGoogleSilently({
    bool suppressErrors = true,
    bool reAuthenticate = false,
  });
}
