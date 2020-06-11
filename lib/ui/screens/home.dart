import 'package:flutter/material.dart';
import 'package:flutter_gpskin/ui/screens/connect_device.dart';
import 'package:flutter_gpskin/ui/screens/settings.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 50.0),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0, right: 20.0),
                  child: new Container(
                    child: Stack(
                      children: <Widget>[
                        Center(
                          child: new Image.asset(
                            "assets/images/logo_blue/logo_blue.png",
                            width: 120,
                            height: 32,
                          ),
                        ),
                        Positioned(
                            right: 0,
                            child: InkWell(
                              child: new Icon(
                              Icons.tune,
                              size: 30.0,
                              color: Colors.grey,
                              ),
                              onTap: () => Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => SettingScreen())),
                            ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 35.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: new Text(
                    "Today’s schedule",
                    style:
                    TextStyle(fontSize: 30.0, fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: new Text(
                    "It’s important to manage your skin everyday",
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w100,
                        color: Colors.grey),
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "TO DO",
                          style: TextStyle(fontSize: 18.0),
                        ),
                        Divider(
                          height: 40.0,
                          thickness: 1.0,
                          color: Colors.black,
                        ),
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text('Time', textAlign: TextAlign.start),
                      SizedBox(
                        width: 25.0,
                      ),
                      Text('Progress', textAlign: TextAlign.start),
                      SizedBox(
                        width: 25.0,
                      ),
                      Text('Description', textAlign: TextAlign.start),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                    padding: const EdgeInsets.only(left: 40.0),
                    alignment: Alignment.centerRight,
                    child: Visibility(
                      visible: false,
                      child: Text(
                        "There is no account matching the information you entered. Please check again",
                        style: TextStyle(
                          color: Colors.redAccent,
                        ),
                      ),
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
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FindDevice())),
                child: Center(
                  child: Text("MEASURE",
                      style: TextStyle(color: Colors.white, fontSize: 22.0)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
