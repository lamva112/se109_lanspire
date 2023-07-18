
import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:se109_lanspire/data/remote_services/interfaces/class_detail_remote_service.dart';
import 'package:se109_lanspire/data/responses/class_detail_response.dart';

import '../../core/core.dart';

class ClassDetailRemoteService extends IClassDetailRemoteService {
  late final INetworkUtility _networkUtility;

  ClassDetailRemoteService() : _networkUtility = GetIt.I.get<INetworkUtility>(instanceName: NetworkConstant.authorizationDomain);
  @override
  Future<ClassResponse?> getClassDetailByClassId({required String classId}) async {
    Map<String, dynamic> data = {};
    try {
      final response = await _networkUtility.request('http://192.168.165.30:8080/api/classes/$classId', Method.GET);


      if(response.statusCode == 200){
        print("no nhu nay ne class ${response.data}");
        data = json.decode(response.data) as Map<String, dynamic>;
      }else{
        print(response.statusCode);
        print("thử lại đi nha class");
      }


    }catch (error) {
      // An error occurred, handle the exception
      print('Error: $error');
    }
    // UserModel user = UserModel.fromJson(data["User"]);
    // print("user1 = ${user.email}");
    // Classes classes = Classes.fromJson(data["User"]);
    // print("user2 = ${user1.displayName}");
    ClassResponse a = ClassResponse.fromJson(data);
    print("loi day ha class ${a.students?.length??0}");
    return ClassResponse.fromJson(data);

  }

}