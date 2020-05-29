import 'package:flutter_gpskin/models/information_list.dart';
import 'package:flutter_gpskin/models/measurement_list.dart';
import 'package:flutter_gpskin/models/subject_setting/subject_setting.dart';
import 'package:flutter_gpskin/models/task_result.dart';

class User {
  int _pk;
  String _subjectId;
  String _password;
  List<MeasurementList> _measurementList;
  SubjectSetting _subjectSetting;
  List<TaskResultList> _taskResultList;
  List<InformationList> _informationList;
  bool _deleted;
  bool _activate;

  User({int pk, String subjectId, String password, List<Null> measurementList, SubjectSetting subjectSetting, List<Null> taskResultList, List<Null> informationList, bool deleted, bool activate}) {
    this._pk = pk;
    this._subjectId = subjectId;
    this._password = password;
    this._measurementList = measurementList;
    this._subjectSetting = subjectSetting;
    this._taskResultList = taskResultList;
    this._informationList = informationList;
    this._deleted = deleted;
    this._activate = activate;
  }

  User.fromJson(Map<String, dynamic> json) {
    _pk = json['pk'];
    _subjectId = json['subjectId'];
    _password = json['password'];
    if (json['measurementList'] != null) {
      _measurementList = new List<MeasurementList>();
      json['measurementList'].forEach((v) {
        _measurementList.add(new MeasurementList.fromJson(v));
      });
    }
    _subjectSetting = json['subjectSetting'] != null ? new SubjectSetting.fromJson(json['subjectSetting']) : null;
    if (json['taskResultList'] != null) {
      _taskResultList = new List<TaskResultList>();
      json['taskResultList'].forEach((v) { _taskResultList.add(new TaskResultList.fromJson(v)); });
    }
    if (json['informationList'] != null) {
      _informationList = new List<InformationList>();
      json['informationList'].forEach((v) { _informationList.add(new InformationList.fromJson(v)); });
    }
    _deleted = json['deleted'];
    _activate = json['activate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pk'] = this._pk;
    data['subjectId'] = this._subjectId;
    data['password'] = this._password;
    if (this._measurementList != null) {
      data['measurementList'] = this._measurementList.map((v) => v.toJson()).toList();
    }
    if (this._subjectSetting != null) {
      data['subjectSetting'] = this._subjectSetting.toJson();
    }
    if (this._taskResultList != null) {
      data['taskResultList'] = this._taskResultList.map((v) => v.toJson()).toList();
    }
    if (this._informationList != null) {
      data['informationList'] = this._informationList.map((v) => v.toJson()).toList();
    }
    data['deleted'] = this._deleted;
    data['activate'] = this._activate;
    return data;
  }
}