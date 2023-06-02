import 'package:dartz/dartz.dart';
import 'package:se109_lanspire/data/remote_services/interfaces/user_remote_service.dart';
import 'package:se109_lanspire/data/repositories/interfaces/user_repository.dart';

import '../../core/core.dart';
import '../data.dart';
import '../responses/user_info_response.dart';

class UserRepository extends IUserRepository {
  final IUserRemoteService userService;
  final INetworkInfo networkInfo;

  UserRepository({required this.userService, required this.networkInfo});

  @override
  Future<Either<Failure, UserInfoResponse?>> getUserInfo() async {
    final isConnected = await networkInfo.isConnected;
    try {
      if (isConnected) {
        var user = await userService.getUserInfo();
        return Right(user);
      }
      return Right(null);
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, UserInfoResponse?>> updateUserInfo({
    SettingModel? setting,
    String? name,
    ImageModel? image,
    String? phoneNumber,
    String? email,
    bool? isPhoneNumberVerified,
    String? birthDay,
    String? country,
    String? gender,
  }) async {
    final isConnected = await networkInfo.isConnected;
    try {
      if (isConnected) {
        var user = await userService.updateUserInfo(
          setting: setting?.toJson(),
          name: name,
          image: image?.toJson(),
          phoneNumber: phoneNumber,
          email: email,
          isPhoneNumberVerified: isPhoneNumberVerified,
          birthDay: birthDay,
          gender: gender,
        );
        return Right(user);
      }
      return Right(null);
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(UnknownFailure());
    }
  }

  @override
  Future<Either<Failure, UserInfoResponse?>> getUserPaymentMethods() async {
    final isConnected = await networkInfo.isConnected;
    try {
      if (isConnected) {
        var methods = await userService.getUserPaymentMethods();
        return Right(methods);
      }
      return Right(null);
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(UnknownFailure());
    }
  }
}
