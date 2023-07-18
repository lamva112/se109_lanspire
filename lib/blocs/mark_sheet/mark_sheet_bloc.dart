import '../../core/core.dart';
import '../../data/data.dart';
import '../blocs.dart';

class MarkSheetBloc extends BaseBloc<MarkSheetState> {
  Stream<bool?> get successStream => stateStream.map((event) => event.success).distinct();

  Stream<String?> get errorStream => stateStream.map((event) => event.error);

  Stream<List<Exams>?> get examStream => stateStream.map((event) => event.exams);

  Future<void> loadData() async {
    await Future.delayed(Duration(seconds: 2));
    emit(
      MarkSheetState(state: state, success: true),
    );
  }

  void getListExam(List<Exams>? exams){
    emit(
      MarkSheetState(state: state, exams: exams),
    );
  }


  @override
  void dispose() {
    super.dispose();
  }
}