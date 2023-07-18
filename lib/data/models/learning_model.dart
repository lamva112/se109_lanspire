class Learning {
  String? idStudent;
  String? idClass;

  Learning({this.idStudent, this.idClass});

  Learning.fromJson(Map<String, dynamic> json) {
    idStudent = json['idStudent'];
    idClass = json['idClass'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idStudent'] = this.idStudent;
    data['idClass'] = this.idClass;
    return data;
  }
}
