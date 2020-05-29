class SubjectSetting {
  int pk;
  String name;
  String description;
  List<Null> bodyPartList;
  List<Null> informationList;
  List<Null> taskList;
  bool showResult;

  SubjectSetting(
      {this.pk,
        this.name,
        this.description,
        this.bodyPartList,
        this.informationList,
        this.taskList,
        this.showResult});

  SubjectSetting.fromJson(Map<String, dynamic> json) {
    pk = json['pk'];
    name = json['name'];
    description = json['description'];
    if (json['bodyPartList'] != null) {
      bodyPartList = new List<Null>();
      json['bodyPartList'].forEach((v) {
        bodyPartList.add(new Null.fromJson(v));
      });
    }
    if (json['informationList'] != null) {
      informationList = new List<Null>();
      json['informationList'].forEach((v) {
        informationList.add(new Null.fromJson(v));
      });
    }
    if (json['taskList'] != null) {
      taskList = new List<Null>();
      json['taskList'].forEach((v) {
        taskList.add(new Null.fromJson(v));
      });
    }
    showResult = json['showResult'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pk'] = this.pk;
    data['name'] = this.name;
    data['description'] = this.description;
    if (this.bodyPartList != null) {
      data['bodyPartList'] = this.bodyPartList.map((v) => v.toJson()).toList();
    }
    if (this.informationList != null) {
      data['informationList'] =
          this.informationList.map((v) => v.toJson()).toList();
    }
    if (this.taskList != null) {
      data['taskList'] = this.taskList.map((v) => v.toJson()).toList();
    }
    data['showResult'] = this.showResult;
    return data;
  }
}