
import '../../core/base/base.dart';
import '../../data/data.dart';
import '../blocs.dart';

class TimeTableBloc extends BaseBloc<TimeTableState> {
  Stream<bool?> get successStream => stateStream.map((event) => event.success).distinct();

  Stream<String?> get errorStream => stateStream.map((event) => event.error);

  Stream<List<Classes>?> get examStream => stateStream.map((event) => event.classes);

  Future<void> loadData() async {
    await Future.delayed(Duration(seconds: 2));
    emit(
      TimeTableState(state: state, success: true),
    );
  }

  void getClassesData(List<Classes>? classes){
    emit(
      TimeTableState(state: state, classes: classes),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}