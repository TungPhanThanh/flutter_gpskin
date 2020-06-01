class TaskResultList {
  int _pk;
  Task _task;
  String _result;
  int _doneTime;

  TaskResultList({int pk, Task task, String result, int doneTime}) {
    this._pk = pk;
    this._task = task;
    this._result = result;
    this._doneTime = doneTime;
  }

  TaskResultList.fromJson(Map<String, dynamic> json) {
    _pk = json['pk'];
    _task = json['task'] != null ? new Task.fromJson(json['task']) : null;
    _result = json['result'];
    _doneTime = json['doneTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pk'] = this._pk;
    if (this._task != null) {
      data['task'] = this._task.toJson();
    }
    data['result'] = this._result;
    data['doneTime'] = this._doneTime;
    return data;
  }
}

class Task {
  int _pk;
  String _name;
  String _startTime;
  int _timeLimit;
  String _taskId;
  String _taskType;
  String _description;

  Task(
      {int pk,
        String name,
        String startTime,
        int timeLimit,
        String taskId,
        String taskType,
        String description}) {
    this._pk = pk;
    this._name = name;
    this._startTime = startTime;
    this._timeLimit = timeLimit;
    this._taskId = taskId;
    this._taskType = taskType;
    this._description = description;
  }

  Task.fromJson(Map<String, dynamic> json) {
    _pk = json['pk'];
    _name = json['name'];
    _startTime = json['startTime'];
    _timeLimit = json['timeLimit'];
    _taskId = json['taskId'];
    _taskType = json['taskType'];
    _description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pk'] = this._pk;
    data['name'] = this._name;
    data['startTime'] = this._startTime;
    data['timeLimit'] = this._timeLimit;
    data['taskId'] = this._taskId;
    data['taskType'] = this._taskType;
    data['description'] = this._description;
    return data;
  }
}
