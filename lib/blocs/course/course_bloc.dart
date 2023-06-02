import '../../core/core.dart';
import '../blocs.dart';

class CourseBloc extends BaseBloc<CourseState> {
  Stream<bool?> get successStream => stateStream.map((event) => event.success).distinct();

  Stream<String?> get errorStream => stateStream.map((event) => event.error);

  Future<void> loadData() async {
    await Future.delayed(Duration(seconds: 2));
    emit(
      CourseState(state: state, success: true),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}