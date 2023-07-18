import 'package:se109_lanspire/data/models/column_course_model.dart';

class Columns {
  String? idColumn;
  String? columnName;
  int? min;
  int? max;
  String? idCourseType;
  bool? isDeleted;
  ColumnCourse? columnCourse;

  Columns(
      {this.idColumn,
        this.columnName,
        this.min,
        this.max,
        this.idCourseType,
        this.isDeleted,
        this.columnCourse});

  Columns.fromJson(Map<String, dynamic> json) {
    idColumn = json['idColumn'];
    columnName = json['columnName'];
    min = json['min'];
    max = json['max'];
    idCourseType = json['idCourseType'];
    isDeleted = json['isDeleted'];
    columnCourse = json['Column_Course'] != null
        ? new ColumnCourse.fromJson(json['Column_Course'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idColumn'] = this.idColumn;
    data['columnName'] = this.columnName;
    data['min'] = this.min;
    data['max'] = this.max;
    data['idCourseType'] = this.idCourseType;
    data['isDeleted'] = this.isDeleted;
    if (this.columnCourse != null) {
      data['Column_Course'] = this.columnCourse!.toJson();
    }
    return data;
  }
}
