import '../../core/core.dart';
import '../../data/data.dart';
import '../blocs.dart';

class CourseBloc extends BaseBloc<CourseState> {
  Stream<bool?> get successStream => stateStream.map((event) => event.success).distinct();

  Stream<String?> get errorStream => stateStream.map((event) => event.error);

  Stream<List<Classes>?> get classStream => stateStream.map((event) => event.classes);

  Future<void> loadData() async {
    await Future.delayed(Duration(seconds: 2));
    emit(
      CourseState(state: state, success: true),
    );
  }

  void getClassesData(List<Classes>? classes){
    emit(
      CourseState(state: state, classes: classes),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}