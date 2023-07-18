import 'package:dartz/dartz.dart';

import '../../../core/core.dart';
import '../../data.dart';

abstract class IHomeRepository {
  Future<Either<Failure, StudentResponse?>> getStudentData({required String userId});
}