import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => SettingScreenState();

}

class SettingScreenState extends State<SettingScreen> {
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
            const SizedBox(height: 50.0,),
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: new Text(
                "About you",
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
            const SizedBox(height: 70.0,),
            Padding(
                padding: const EdgeInsets.only(left: 40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Title 1",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Name',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
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
                      "Title 2",
                      style: TextStyle(fontSize: 18.0),
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Number only',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
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
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Minimum 8 characters',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}