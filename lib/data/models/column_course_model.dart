class ColumnCourse {
  String? idColumn;
  String? idCourse;

  ColumnCourse({this.idColumn, this.idCourse});

  ColumnCourse.fromJson(Map<String, dynamic> json) {
    idColumn = json['idColumn'];
    idCourse = json['idCourse'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idColumn'] = this.idColumn;
    data['idCourse'] = this.idCourse;
    return data;
  }
}
