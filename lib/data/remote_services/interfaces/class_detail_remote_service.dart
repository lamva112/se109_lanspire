import '../../responses/class_detail_response.dart';

abstract class IClassDetailRemoteService {
  Future<ClassResponse?> getClassDetailByClassId({required String classId});
}