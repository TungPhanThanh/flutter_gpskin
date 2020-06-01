class Notice {
  int pk;
  String title;
  String content;
  int wroteAt;

  Notice({this.pk, this.title, this.content, this.wroteAt});

  Notice.fromJson(Map<String, dynamic> json) {
    pk = json['pk'];
    title = json['title'];
    content = json['content'];
    wroteAt = json['wroteAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pk'] = this.pk;
    data['title'] = this.title;
    data['content'] = this.content;
    data['wroteAt'] = this.wroteAt;
    return data;
  }
}
