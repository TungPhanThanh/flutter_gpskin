import 'package:flutter_gpskin/models/subject_setting/Task.dart';
import 'package:flutter_gpskin/models/subject_setting/body_part.dart';
import 'package:flutter_gpskin/models/subject_setting/subject_information.dart';

class SubjectSetting {
  int pk;
  String name;
  String description;
  List<BodyPartList> bodyPartList;
  List<SubjectInformation> informationList;
  List<Task> taskList;
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
      bodyPartList = new List<BodyPartList>();
      json['bodyPartList'].forEach((v) {
        bodyPartList.add(new BodyPartList.fromJson(v));
      });
    }
    if (json['informationList'] != null) {
      informationList = new List<SubjectInformation>();
      json['informationList'].forEach((v) {
        informationList.add(new SubjectInformation.fromJson(v));
      });
    }
    if (json['taskList'] != null) {
      taskList = new List<Task>();
      json['taskList'].forEach((v) {
        taskList.add(new Task.fromJson(v));
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
