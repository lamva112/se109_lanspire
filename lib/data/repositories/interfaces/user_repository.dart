import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../data.dart';

abstract class IUserRepository {
  Future<Either<Failure, UserModel?>> getUserInfo({required String userId});

}
