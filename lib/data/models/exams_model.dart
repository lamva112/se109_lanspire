import 'package:se109_lanspire/data/models/class_model.dart';
import 'package:se109_lanspire/data/models/testing_model.dart';
import 'package:se109_lanspire/extensions/extensions.dart';

class Exams {
  String? idExam;
  String? examName;
  List<String>? fileUrl;
  String? postedDate;
  String? testTime;
  String? testDate;
  String? idClass;
  String? idTestType;
  String? idColumn;
  Testing? testing;
  Class? classes;
  DateTime? dateTest;

  Exams(
      {this.idExam, this.examName, this.fileUrl, this.postedDate, this.testTime, this.testDate, this.idClass, this.idTestType, this.idColumn, this.testing, this.classes});

  Exams.fromJson(Map<String, dynamic> json) {
    idExam = json['idExam'];
    examName = json['examName'];
    fileUrl = json['fileUrl'].cast<String>();
    if (json['postedDate'] != null && json['postedDate'] is String) {
      String convertValue = json['postedDate'];
      postedDate = convertValue.covertToAppDateTime();
    }
    testTime = json['testTime'];
    if (json['testDate'] != null && json['testDate'] is String) {
      String convertValue = json['testDate'];
      testDate = convertValue.covertToAppDateTime();
    }
    idClass = json['idClass'];
    idTestType = json['idTestType'];
    idColumn = json['idColumn'];
    testing = json['Testing'] != null ? Testing.fromJson(json['Testing']) : null;
    classes = json['Class'] != null ? Class.fromJson(json['Class']) : null;
    if (json['testDate'] != null && json['testDate'] is String) {
      String convertValue = json['testDate'];
      dateTest = convertValue.convertToDateTimeDataTypes();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['idExam'] = this.idExam;
    data['examName'] = this.examName;
    data['fileUrl'] = this.fileUrl;
    data['postedDate'] = this.postedDate;
    data['testTime'] = this.testTime;
    data['testDate'] = this.testDate;
    data['idClass'] = this.idClass;
    data['idTestType'] = this.idTestType;
    data['idColumn'] = this.idColumn;
    if (this.testing != null) {
      data['Testing'] = this.testing!.toJson();
    }
    if (this.classes != null) {
      data['Class'] = this.classes!.toJson();
    }
    return data;
  }
}
