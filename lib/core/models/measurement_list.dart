class MeasurementList {
  int _pk;
  String _measuredAt;
  List<MeasurementResults> _measurementResults;

  MeasurementList({int pk, String measuredAt, List<MeasurementResults> measurementResults}) {
    this._pk = pk;
    this._measuredAt = measuredAt;
    this._measurementResults = measurementResults;
  }

  MeasurementList.fromJson(Map<String, dynamic> json) {
    _pk = json['pk'];
    _measuredAt = json['measuredAt'];
    if (json['measurementResults'] != null) {
      _measurementResults = new List<MeasurementResults>();
      json['measurementResults'].forEach((v) {
        _measurementResults.add(new MeasurementResults.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pk'] = this._pk;
    data['measuredAt'] = this._measuredAt;
    if (this._measurementResults != null) {
      data['measurementResults'] =
          this._measurementResults.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MeasurementResults {
  int _pk;
  int _sch;
  double _tewl;
  int _sebum;
  int _temperature;
  int _humidity;
  int _repeatCount;
  int _repeatOrder;
  String _measuredAt;
  String _partName;
  String _partCode;

  MeasurementResults(
      {int pk,
      int sch,
      double tewl,
      int sebum,
      int temperature,
      int humidity,
      int repeatCount,
      int repeatOrder,
      String measuredAt,
      String partName,
      String partCode}) {
    this._pk = pk;
    this._sch = sch;
    this._tewl = tewl;
    this._sebum = sebum;
    this._temperature = temperature;
    this._humidity = humidity;
    this._repeatCount = repeatCount;
    this._repeatOrder = repeatOrder;
    this._measuredAt = measuredAt;
    this._partName = partName;
    this._partCode = partCode;
  }

  MeasurementResults.fromJson(Map<String, dynamic> json) {
    _pk = json['pk'];
    _sch = json['sch'];
    _tewl = json['tewl'];
    _sebum = json['sebum'];
    _temperature = json['temperature'];
    _humidity = json['humidity'];
    _repeatCount = json['repeatCount'];
    _repeatOrder = json['repeatOrder'];
    _measuredAt = json['measuredAt'];
    _partName = json['partName'];
    _partCode = json['partCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pk'] = this._pk;
    data['sch'] = this._sch;
    data['tewl'] = this._tewl;
    data['sebum'] = this._sebum;
    data['temperature'] = this._temperature;
    data['humidity'] = this._humidity;
    data['repeatCount'] = this._repeatCount;
    data['repeatOrder'] = this._repeatOrder;
    data['measuredAt'] = this._measuredAt;
    data['partName'] = this._partName;
    data['partCode'] = this._partCode;
    return data;
  }
}
