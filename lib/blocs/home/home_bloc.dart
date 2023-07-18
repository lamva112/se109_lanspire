import '../../core/core.dart';
import '../../data/data.dart';
import '../blocs.dart';

class HomeBloc extends BaseBloc<HomeState> {
  final IHomeRepository homeRepository;
  final ISharedPreferencesRepository sharedPreferencesRepo;
  HomeBloc(this.homeRepository,this.sharedPreferencesRepo);
  Stream<bool?> get successStream => stateStream.map((event) => event.success).distinct();

  Stream<String?> get errorStream => stateStream.map((event) => event.error);

  Stream<StudentResponse?> get studentStream => stateStream.map((event) => event.student);

  Future<void> getStudentData({required String userId}) async {
    emitLoading(true);
    homeRepository.getStudentData(userId: sharedPreferencesRepo.getToken()??"").then((value) {
      value.fold(
            (failure) {
              print("vào failure");
          emit(HomeState(state: state, error: failure.toString()));
        },
            (data) {
              print("data nè bà ${data?.user?.email}"??"data khum có");
          emit(HomeState(state: state,student: data));
        },
      );
    }).catchError((err) {
      print("vao e ${err}");
      emit(HomeState(state: state, error: err));
    }).whenComplete(() => emitLoading(false));
  }


  @override
  void dispose() {
    super.dispose();
  }
}
