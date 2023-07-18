class TimeFrame {
  String? idTimeFrame;
  String? startingTime;
  String? endingTime;
  bool? activate;

  TimeFrame(
      {this.idTimeFrame, this.startingTime, this.endingTime, this.activate});

  TimeFrame.fromJson(Map<String, dynamic> json) {
    idTimeFrame = json['idTimeFrame'];
    startingTime = json['startingTime'];
    endingTime = json['endingTime'];
    activate = json['activate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idTimeFrame'] = this.idTimeFrame;
    data['startingTime'] = this.startingTime;
    data['endingTime'] = this.endingTime;
    data['activate'] = this.activate;
    return data;
  }
}
