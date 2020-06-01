class InformationList {
  int pk;
  String title;
  String content;
  String informationType;
  int order;

  InformationList(
      {this.pk, this.title, this.content, this.informationType, this.order});

  InformationList.fromJson(Map<String, dynamic> json) {
    pk = json['pk'];
    title = json['title'];
    content = json['content'];
    informationType = json['informationType'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pk'] = this.pk;
    data['title'] = this.title;
    data['content'] = this.content;
    data['informationType'] = this.informationType;
    data['order'] = this.order;
    return data;
  }
}
