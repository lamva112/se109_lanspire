class Level {
  String? idLevel;
  String? levelName;
  String? point;
  String? language;
  bool? isDeleted;

  Level({this.idLevel,
    this.levelName,
    this.point,
    this.language,
    this.isDeleted});

  Level.fromJson(Map<String, dynamic> json) {
    idLevel = json['idLevel'];
    levelName = json['levelName'];
    point = json['point'];
    language = json['language'];
    isDeleted = json['isDeleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idLevel'] = this.idLevel;
    data['levelName'] = this.levelName;
    data['point'] = this.point;
    data['language'] = this.language;
    data['isDeleted'] = this.isDeleted;
    return data;
  }

}