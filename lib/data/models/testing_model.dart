class Testing {
  String? idStudent;
  String? idExam;
  double? score;

  Testing({this.idStudent, this.idExam, this.score});

  Testing.fromJson(Map<String, dynamic> json) {
    idStudent = json['idStudent'];
    idExam = json['idExam'];
    if(json['score'] is int){
      int covertValue = json['score'];
      score = covertValue.toDouble();
    }else{
      score = json['score'];
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idStudent'] = this.idStudent;
    data['idExam'] = this.idExam;
    data['score'] = this.score;
    return data;
  }
}
