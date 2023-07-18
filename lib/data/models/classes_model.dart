import 'package:se109_lanspire/data/models/class_time.dart';

import 'learning_model.dart';
import '../../extensions/extensions.dart';

class Classes {
  String? idClass;
  String? className;
  String? idCourse;
  String? room;
  String? startDate;
  String? endDate;
  bool? isDeleted;
  Learning? learning;
  List<ClassTimes>? classTimes;

  Classes({this.idClass, this.className, this.idCourse, this.room, this.startDate, this.endDate, this.isDeleted, this.learning,this.classTimes});

  Classes.fromJson(Map<String, dynamic> json) {
    idClass = json['idClass'];
    className = json['className'];
    idCourse = json['idCourse'];
    room = json['room'];
    if(json['startDate'] != null && json['startDate'] is String){
       String convertValue = json['startDate'];
       startDate = convertValue.covertToAppDateTime();
    }
    //startDate = json['startDate'];
    if(json['endDate'] != null && json['endDate'] is String){
      String convertValue = json['endDate'];
      endDate = convertValue.covertToAppDateTime();
    }
    //endDate = json['endDate'];
    isDeleted = json['isDeleted'];
    learning = json['Learning'] != null ?  Learning.fromJson(json['Learning']) : null;
    if (json['ClassTimes'] != null) {
      classTimes = <ClassTimes>[];
      json['ClassTimes'].forEach((v) { classTimes!.add(new ClassTimes.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idClass'] = this.idClass;
    data['className'] = this.className;
    data['idCourse'] = this.idCourse;
    data['room'] = this.room;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['isDeleted'] = this.isDeleted;
    if (this.learning != null) {
      data['Learning'] = this.learning!.toJson();
    }
    if (this.classTimes != null) {
      data['ClassTimes'] = this.classTimes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
