import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:se109_lanspire/data/responses/user_info_response.dart';

import '../../core/core.dart';
import '../../enums.dart';

import '../data.dart';
import 'interfaces/user_remote_service.dart';

var userData = {
  'user': {
    "id": "1",
    "email": "kimjason@gmail.com",
    "phoneNumber": "01265713591",
    "name": "Jason Kim",
    "image": {
      "path":
          'https://images.unsplash.com/photo-1672036798950-492988e175a9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwyfHx8ZW58MHx8fHw%3D&auto=format&fit=crop&w=500&q=60',
      "type": "network",
    },
    "isPhoneNumberVerified": true,
    'setting': {
      'pushNotification': true,
      'emailNotification': true,
    },
    "membershipClassType": "standard",
    "points": 200,
    "expiredDate": "2024-10-01T10:42:00.000000Z",
    "birthDay": "2001-12-06",
    "gender": "MALE",
    "country": "Vietnam",
    "discountCode": 5,
  }
};

var userPaymentMethods = {
  'paymentMethods': [],
};

class UserRemoteService extends IUserRemoteService {
  late final INetworkUtility _networkUtility;

  UserRemoteService() : _networkUtility = GetIt.I.get<INetworkUtility>(instanceName: NetworkConstant.authorizationDomain);
  @override
  Future<UserModel?> getUserInfo({required String userId}) async {
    Map<String, dynamic> data = {};
    try {
      final response = await _networkUtility.request('http://192.168.165.30:8080/api/users/$userId', Method.GET);
      if(response.statusCode == 200){
        data = json.decode(response.data) as Map<String, dynamic>;
      }else{
        print(response.statusCode);
        print("thử lại đi nha");
      }
    }catch (error) {
      print('Error: $error');
    }
    return UserModel.fromJson(data);
  }

}
