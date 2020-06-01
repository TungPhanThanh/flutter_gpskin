import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DeviceID extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => DeviceIDState();

}

class DeviceIDState extends State<DeviceID>{

  @override
  Widget build(BuildContext context) {
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
                "Device ID",
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: new TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'None',
                  hintStyle: TextStyle(color: Colors.grey),
                ),
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
                      "Found Devices",
                      style: TextStyle(fontSize: 18.0),
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
                      "Device ID:",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Divider(
                      height: 30.0,
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
                      "Device ID:",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Divider(
                      height: 30.0,
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
                      "Device ID:",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    Divider(
                      height: 30.0,
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