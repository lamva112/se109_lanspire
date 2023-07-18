import 'package:dartz/dartz.dart';
import 'package:se109_lanspire/data/remote_services/interfaces/class_detail_remote_service.dart';

import '../../core/core.dart';
import '../data.dart';
import '../remote_services/interfaces/home_remote_service.dart';
import '../responses/class_detail_response.dart';

class ClassDetailRepository extends IClassDetailRepository {
  final IClassDetailRemoteService remoteService;
  final INetworkInfo networkInfo;

  ClassDetailRepository({
    required this.remoteService,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, ClassResponse?>> getClassDetailData({required String classId}) async {
    final isConnected = await networkInfo.isConnected;
    try {
      if (isConnected) {
        final remoteData = await remoteService.getClassDetailByClassId(classId: classId);
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
