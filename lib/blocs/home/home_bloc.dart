import '../../core/core.dart';
import '../blocs.dart';

class HomeBloc extends BaseBloc<HomeState> {
  Stream<bool?> get successStream => stateStream.map((event) => event.success).distinct();

  Stream<String?> get errorStream => stateStream.map((event) => event.error);

  Future<void> loadData() async {
    await Future.delayed(Duration(seconds: 2));
    emit(
      HomeState(state: state, success: true),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
