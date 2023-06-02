import '../../../enums.dart';
import '../../data.dart';
import '../../responses/user_info_response.dart';

abstract class IUserRemoteService {
  Future<UserInfoResponse> getUserInfo();

  Future<UserInfoResponse> updateUserInfo({
    Map<String, dynamic>? setting,
    String? name,
    Map<String, dynamic>? image,
    String? phoneNumber,
    String? email,
    bool? isPhoneNumberVerified,
    String? birthDay,
    String? gender,
  });

  Future<UserInfoResponse> getUserPaymentMethods();
}
