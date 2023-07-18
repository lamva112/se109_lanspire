import 'dart:io';

import 'package:se109_lanspire/data/repositories/interfaces/user_repository.dart';

import '../../data/data.dart';
import '../../data/models/models.dart';

import '../blocs.dart';

import '../../core/base/base.dart';

class UserInformationBloc extends BaseBloc<UserInformationState> {
  final IUserRepository userRepository;
  final ISharedPreferencesRepository sharedPreferencesRepo;
  UserInformationBloc(this.userRepository,this.sharedPreferencesRepo);
  Stream<File?> get imageFileStream => stateStream.map((event) => event.imageFile);

  Stream<UserModel?> get userStream => stateStream.map((event) => event.user);

  void setAvatar(String filePath) {
    emit(UserInformationState(state: state, imageFile: File(filePath), isImageChanged: true));
  }

  void getUserData(UserModel? user){
    emit(UserInformationState(state: state,user: user));
  }

  Future<void> getStudentData({required String userId}) async {
    emitLoading(true);
    userRepository.getUserInfo(userId: sharedPreferencesRepo.getToken()??"").then((value) {
      value.fold(
            (failure) {
          print("vào failure");
          emit(UserInformationState(state: state, error: failure.toString()));
        },
            (data) {
          print("data nè bà ${data?.address}"??"data khum có");
          emit(UserInformationState(state: state,user: data));
        },
      );
    }).catchError((err) {
      print("vao e ${err}");
      emit(UserInformationState(state: state, error: err));
    }).whenComplete(() => emitLoading(false));
  }
}
