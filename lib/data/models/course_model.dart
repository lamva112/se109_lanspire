import 'package:se109_lanspire/data/models/column_model.dart';
import 'package:se109_lanspire/data/models/course_type_model.dart';
import 'package:se109_lanspire/data/models/level_model.dart';

class Course {
  String? idCourse;
  String? courseName;
  String? fee;
  String? description;
  int? max;
  String? idLevel;
  String? idCourseType;
  bool? isDeleted;
  List<Columns>? columns;
  CourseType? courseType;
  Level? level;

  Course(
      {this.idCourse,
        this.courseName,
        this.fee,
        this.description,
        this.max,
        this.idLevel,
        this.idCourseType,
        this.isDeleted,
        this.columns,
        this.courseType,
        this.level});

  Course.fromJson(Map<String, dynamic> json) {
    idCourse = json['idCourse'];
    courseName = json['courseName'];
    fee = json['fee'];
    description = json['description'];
    max = json['max'];
    idLevel = json['idLevel'];
    idCourseType = json['idCourseType'];
    isDeleted = json['isDeleted'];
    if (json['Columns'] != null) {
      columns = <Columns>[];
      json['Columns'].forEach((v) {
        columns!.add( Columns.fromJson(v));
      });
    }
    courseType = json['CourseType'] != null
        ? new CourseType.fromJson(json['CourseType'])
        : null;
    level = json['Level'] != null ?  Level.fromJson(json['Level']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idCourse'] = this.idCourse;
    data['courseName'] = this.courseName;
    data['fee'] = this.fee;
    data['description'] = this.description;
    data['max'] = this.max;
    data['idLevel'] = this.idLevel;
    data['idCourseType'] = this.idCourseType;
    data['isDeleted'] = this.isDeleted;
    if (this.columns != null) {
      data['Columns'] = this.columns!.map((v) => v.toJson()).toList();
    }
    if (this.courseType != null) {
      data['CourseType'] = this.courseType!.toJson();
    }
    if (this.level != null) {
      data['Level'] = this.level!.toJson();
    }
    return data;
  }
}
