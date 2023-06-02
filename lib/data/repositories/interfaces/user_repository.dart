import 'package:dartz/dartz.dart';

import '../../../../core/core.dart';
import '../../data.dart';
import '../../responses/user_info_response.dart';

abstract class IUserRepository {
  Future<Either<Failure, UserInfoResponse?>> getUserInfo();

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
  });

  Future<Either<Failure, UserInfoResponse?>> getUserPaymentMethods();
}
