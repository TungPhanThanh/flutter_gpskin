class BodyPartList {
  int pk;
  String partname;
  String partCode;
  int order;
  int repeatCount;
  int measureRange;
  int minTewl;
  int minSch;

  BodyPartList(
      {this.pk,
        this.partname,
        this.partCode,
        this.order,
        this.repeatCount,
        this.measureRange,
        this.minTewl,
        this.minSch});

  BodyPartList.fromJson(Map<String, dynamic> json) {
    pk = json['pk'];
    partname = json['partname'];
    partCode = json['partCode'];
    order = json['order'];
    repeatCount = json['repeatCount'];
    measureRange = json['measureRange'];
    minTewl = json['minTewl'];
    minSch = json['minSch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pk'] = this.pk;
    data['partname'] = this.partname;
    data['partCode'] = this.partCode;
    data['order'] = this.order;
    data['repeatCount'] = this.repeatCount;
    data['measureRange'] = this.measureRange;
    data['minTewl'] = this.minTewl;
    data['minSch'] = this.minSch;
    return data;
  }
}
