import 'package:dartz/dartz.dart';

import '../../../core/core.dart';
import '../../responses/class_detail_response.dart';

abstract class IClassDetailRepository {
  Future<Either<Failure, ClassResponse?>> getClassDetailData({required String classId});
}