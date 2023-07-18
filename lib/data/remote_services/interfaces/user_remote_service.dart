import '../../data.dart';
import '../../responses/user_info_response.dart';

abstract class IUserRemoteService {
  Future<UserModel?> getUserInfo({required String userId});
}
