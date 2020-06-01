import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SettingScreenState();
}

class SettingScreenState extends State<SettingScreen> {
  TextEditingController _IdController = new TextEditingController();
  TextEditingController _ScheduleController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    _IdController.text = "User ID";
    _ScheduleController.text = "2020.03.11 - 2020.04.11";
    return Scaffold(
      body: SingleChildScrollView(
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
            const SizedBox(
              height: 50.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: new Text(
                "Settings",
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w400),
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
            const SizedBox(
              height: 70.0,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Log in ID",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    TextField(
                      readOnly: true,
                      enabled: false,
                      controller: _IdController,
                      style: TextStyle(color: Colors.blue),
                      decoration: InputDecoration(),
                    ),
                  ],
                )),
            const SizedBox(
              height: 35.0,
            ),
            Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Study schedule",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    TextField(
                      readOnly: true,
                      enabled: false,
                      controller: _ScheduleController,
                      style: TextStyle(color: Colors.blue),
                      decoration: InputDecoration(),
                    ),
                  ],
                )),
            const SizedBox(height: 45.0),
            Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Edit my info",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Divider(
                      height: 40.0,
                      thickness: 1.0,
                      color: Colors.grey,
                    ),
                  ],
                )),
            const SizedBox(height: 20.0),
            Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Register device",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Divider(
                      height: 40.0,
                      thickness: 1.0,
                      color: Colors.grey,
                    ),
                  ],
                )),
            const SizedBox(height: 15.0),
            Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                          "Log out",
                          style: TextStyle(fontSize: 18.0, color: Colors.red),
                        ),),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0),
                          child: Icon(Icons.exit_to_app, size: 30.0,color: Colors.grey,),
                        )
                      ],
                    ),
                    Divider(
                      height: 40.0,
                      thickness: 1.0,
                      color: Colors.grey,
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
