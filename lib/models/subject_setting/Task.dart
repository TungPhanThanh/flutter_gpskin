class Task {
  int pk;
  String name;
  String startTime;
  int timeLimit;
  String taskId;
  String taskType;
  String description;

  Task(
      {this.pk,
        this.name,
        this.startTime,
        this.timeLimit,
        this.taskId,
        this.taskType,
        this.description});

  Task.fromJson(Map<String, dynamic> json) {
    pk = json['pk'];
    name = json['name'];
    startTime = json['startTime'];
    timeLimit = json['timeLimit'];
    taskId = json['taskId'];
    taskType = json['taskType'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pk'] = this.pk;
    data['name'] = this.name;
    data['startTime'] = this.startTime;
    data['timeLimit'] = this.timeLimit;
    data['taskId'] = this.taskId;
    data['taskType'] = this.taskType;
    data['description'] = this.description;
    return data;
  }
}
