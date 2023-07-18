import 'package:se109_lanspire/data/models/course_model.dart';
import 'package:se109_lanspire/data/models/student_model.dart';
import 'package:se109_lanspire/data/models/time_frame.dart';
import 'package:se109_lanspire/extensions/extensions.dart';

import '../models/class_time.dart';

class ClassResponse {
  String? idClass;
  String? className;
  String? idCourse;
  String? room;
  String? startDate;
  String? endDate;
  bool? isDeleted;
  List<TimeFrames>? timeFrames;
  Course? course;

  //List<Null>? lecturers;
  List<ClassTimes>? classTimes;
  List<Students>? students;

  ClassResponse({this.idClass,
    this.className,
    this.idCourse,
    this.room,
    this.startDate,
    this.endDate,
    this.isDeleted,
    this.timeFrames,
    this.course,
    // this.lecturers,
    this.classTimes,
    this.students});

  ClassResponse.fromJson(Map<String, dynamic> json) {
    idClass = json['idClass'];
    className = json['className'];
    idCourse = json['idCourse'];
    room = json['room'];
    if(json['startDate'] != null && json['startDate'] is String){
      String convertValue = json['startDate'];
      startDate = convertValue.covertToAppDateTime();
    }
    if(json['endDate'] != null && json['endDate'] is String){
      String convertValue = json['endDate'];
      endDate = convertValue.covertToAppDateTime();
    }
    isDeleted = json['isDeleted'];
    if (json['TimeFrames'] != null) {
      timeFrames = <TimeFrames>[];
      json['TimeFrames'].forEach((v) {
        timeFrames!.add(TimeFrames.fromJson(v));
      });
    }
    course =
    json['Course'] != null ? new Course.fromJson(json['Course']) : null;
    // if (json['Lecturers'] != null) {
    //   lecturers = <Null>[];
    //   json['Lecturers'].forEach((v) {
    //     lecturers!.add(new Null.fromJson(v));
    //   });
    // }
    if (json['ClassTimes'] != null) {
      classTimes = <ClassTimes>[];
      json['ClassTimes'].forEach((v) {
        classTimes!.add(new ClassTimes.fromJson(v));
      });
    }
    if (json['Students'] != null) {
      students = <Students>[];
      json['Students'].forEach((v) {
        students!.add(new Students.fromJson(v));
      });
    }
  }
}