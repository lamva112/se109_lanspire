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
  Future<Either<Failure, UserModel?>> getUserInfo({required String userId}) async {
    final isConnected = await networkInfo.isConnected;
    try {
      if (isConnected) {
        var user = await userService.getUserInfo(userId: userId);
        return Right(user);
      }
      return Right(null);
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      return Left(UnknownFailure());
    }
  }

}
