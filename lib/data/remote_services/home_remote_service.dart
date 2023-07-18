import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import '../data.dart';

import '../../core/core.dart';
import 'interfaces/home_remote_service.dart';
import '../responses/student_response.dart';

class HomeRemoteService extends IHomeRemoteService {
  late final INetworkUtility _networkUtility;

  HomeRemoteService() : _networkUtility = GetIt.I.get<INetworkUtility>(instanceName: NetworkConstant.authorizationDomain);

  /// Auth handler


  @override
  Future<StudentResponse?> getStudentByUserId({required String userId}) async {
    Map<String, dynamic> data = {};
    try {
      final response = await _networkUtility.request('http://192.168.165.30:8080/api/students/byIdUser/$userId', Method.GET);


      if(response.statusCode == 200){
        print("no nhu nay ne ${response.data}");
        data = json.decode(response.data) as Map<String, dynamic>;
      }else{
        print(response.statusCode);
        print("thử lại đi nha");
      }


    }catch (error) {
      // An error occurred, handle the exception
      print('Error: $error');
    }
    // UserModel user = UserModel.fromJson(data["User"]);
    // print("user1 = ${user.email}");
    // Classes classes = Classes.fromJson(data["User"]);
    // print("user2 = ${user1.displayName}");
    StudentResponse a = StudentResponse.fromJson(data);
    print("loi day ha ${a.exams?.length??0}");
    return a;
  }
}
