import '../../../enums.dart';
import '../../../extensions/extensions.dart';
import '../../data.dart';

class AuthErrorModel {
  int? status;
  String? name;
  AuthErrorType? errorType;
  AuthErrorDetailsModel? details;

  AuthErrorModel({this.status, this.name, this.errorType, this.details});

  AuthErrorModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    name = json['name'];
    errorType = json['message']?.convertToErrorType();
    details = json['details'] != null ? AuthErrorDetailsModel.fromJson(json['details']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = this.status;
    data['name'] = this.name;
    data['message'] = this.errorType?.convertToMessage();

    if (this.details != null) {
      data['details'] = this.details!.toJson();
    }

    return data;
  }
}
