import '../../responses/student_response.dart';

abstract class IHomeRemoteService {
  Future<StudentResponse?> getStudentByUserId({required String userId});
}