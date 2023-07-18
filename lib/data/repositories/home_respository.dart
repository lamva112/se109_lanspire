import 'package:dartz/dartz.dart';
import 'package:se109_lanspire/data/remote_services/interfaces/home_remote_service.dart';

import '../../core/core.dart';
import '../data.dart';

class HomeRepository extends IHomeRepository {
  final IHomeRemoteService remoteService;
  final INetworkInfo networkInfo;

  HomeRepository({
    required this.remoteService,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, StudentResponse?>> getStudentData({required String userId}) async {
    final isConnected = await networkInfo.isConnected;
    try {
      if (isConnected) {
        final remoteData = await remoteService.getStudentByUserId(userId: userId);
        print("remote data ${remoteData}");
        return Right(remoteData);
      } else {
        return Right(null);
      }
    } on ServerException {
      return Left(ServerFailure());
    } catch (e) {
      print("respository loi ${e}");
      return Left(UnknownFailure());
    }
  }
}
