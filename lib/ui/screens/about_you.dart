import 'package:flutter/material.dart';
import 'package:flutter_gpskin/core/models/information_list.dart';
import 'package:flutter_gpskin/core/services/api.dart';

import 'home.dart';

class AboutScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AboutScreenState();
}

class AboutScreenState extends State<AboutScreen> {
  final _formKey = new GlobalKey<FormState>();
  final Api _api = new Api();
  final InformationList _informationList = new InformationList();
  final String _title1 = "";
  final String _title2 = "";
  final String _title3 = "";


  TextEditingController _field1Controller = new TextEditingController();
  TextEditingController _field2Controller = new TextEditingController();
  TextEditingController _field3Controller = new TextEditingController();

  bool validateString(String value) {
    Pattern pattern = r'^[a-zA-Z ]+$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return false;
    else
      return true;
  }

  bool validateNumeric(String value) {
    Pattern pattern = r'^[0-9]+$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return false;
    else
      return true;
  }

  bool validateDate(String value) {
    Pattern pattern = r'^\d{4}\-(0[1-9]|1[012])\-(0[1-9]|[12][0-9]|3[01])$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return false;
    else
      return true;
  }


  @override
  void initState() {
    super.initState();
//    _api.getInformationList(1).then((value) => null);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Scaffold(
            body: Stack(
              children: <Widget>[
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 50.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 35.0),
                        child: new Container(
                          child: new Icon(
                            Icons.arrow_back,
                            size: 30.0,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      const SizedBox(height: 50.0,),
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: new Text(
                          "About you",
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.w400),
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: new Text(
                          "This information is used solely for your solutions.",
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w100,
                              color: Colors.grey),
                        ),
                      ),
                      const SizedBox(height: 70.0,),
                      Padding(
                          padding: const EdgeInsets.only(left: 40.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('_informationList.title', style: TextStyle(fontSize: 18.0)),
                              TextFormField(
                                validator: (value) {
                                  if (validateString(value)) {
                                    return null;
                                  } else
                                    return '1~20 length and only Characters Text';
                                },
                                controller: _field1Controller,
                                keyboardType: TextInputType.text,
                              ),
                            ],
                          )),
                      const SizedBox(height: 35.0,),
                      Padding(
                          padding: const EdgeInsets.only(left: 40.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Title 2", style: TextStyle(fontSize: 18.0)),
                              TextFormField(
                                validator: (value) {
                                  if (validateNumeric(value)) {
                                    return null;
                                  } else
                                    return '1~10 length and only Numeric Text';
                                },
                                controller: _field2Controller,
                                obscureText: true,
                              ),
                            ],
                          )),
                      const SizedBox(height: 35.0,),
                      Padding(
                          padding: const EdgeInsets.only(left: 40.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Title 3",
                                style: TextStyle(fontSize: 18.0),
                              ),
                              TextFormField(
                                validator: (value) {
                                  if (validateDate(value)) {
                                    return null;
                                  } else
                                    return '’yyyy-MM-dd’ date format text';
                                },
                                controller: _field3Controller,
                                keyboardType: TextInputType.text,
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: 320,
                      height: 90,
                      margin: EdgeInsets.only(bottom: 20.0),
                      padding: EdgeInsets.only(bottom: 10.0),
                      child: RaisedButton(
                        color: Colors.lightBlueAccent,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => HomePage()),
                                  (Route<dynamic> route) => false,
                            );
                          }
                        },
                        child: Center(
                          child: Text("DONE", style: TextStyle(color: Colors
                              .white, fontSize: 22.0)),
                        ),
                      ),
                    ),
                  ),
              ],
            )
        )
    );
  }
}
