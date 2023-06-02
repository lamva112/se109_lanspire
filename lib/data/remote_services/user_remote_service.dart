import 'package:se109_lanspire/data/responses/user_info_response.dart';

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
  @override
  Future<UserInfoResponse> getUserInfo() async {
    return UserInfoResponse.fromJson(userData);
  }

  @override
  Future<UserInfoResponse> updateUserInfo({
    Map<String, dynamic>? setting,
    String? name,
    Map<String, dynamic>? image,
    String? phoneNumber,
    String? email,
    bool? isPhoneNumberVerified,
    String? birthDay,
    String? gender,
    String? country,
  }) async {
    if (name != null) {
      userData['user']?['name'] = name;
    }
    if (birthDay != null) {
      userData['user']?['birthDay'] = birthDay;
    }
    if (gender != null) {
      userData['user']?['gender'] = gender;
    }
    if(country != null){
      userData['user']?['country'] = country;
    }
    if(phoneNumber != null){
      userData['user']?['phoneNumber'] = phoneNumber;
    }
    if(email != null){
      userData['user']?['email'] = email;
    }
    return UserInfoResponse.fromJson(userData);
  }

  @override
  Future<UserInfoResponse> getUserPaymentMethods() async {
    return UserInfoResponse.fromJson(userPaymentMethods);
  }
}
