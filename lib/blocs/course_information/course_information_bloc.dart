import 'package:se109_lanspire/data/responses/class_detail_response.dart';

import '../../core/core.dart';
import '../../data/data.dart';
import '../blocs.dart';

class CourseInformationBloc extends BaseBloc<CourseInformationState> {
  final IClassDetailRepository classDetailRepository;
  CourseInformationBloc(this.classDetailRepository);

  Stream<bool?> get successStream => stateStream.map((event) => event.success).distinct();

  Stream<String?> get errorStream => stateStream.map((event) => event.error);

  Stream<ClassResponse?> get classResponsseStream => stateStream.map((event) => event.classResponse);

  Future<void> getClassDetailData({required String classId}) async {
    emitLoading(true);
    classDetailRepository.getClassDetailData(classId: classId??"").then((value) {
      value.fold(
            (failure) {
          print("vào failure");
          emit(CourseInformationState(state: state, error: failure.toString()));
        },
            (data) {
          print("data nè bà ${data?.className}"??"data khum có");
          emit(CourseInformationState(state: state,classResponse: data));
        },
      );
    }).catchError((err) {
      print("vao e ${err}");
      emit(CourseInformationState(state: state, error: err));
    }).whenComplete(() => emitLoading(false));
  }

  @override
  void dispose() {
    super.dispose();
  }
}