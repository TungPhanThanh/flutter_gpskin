import 'package:flutter/material.dart';
import 'package:flutter_gpskin/core/services/api.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {

  final Api _api = new Api();
  TextEditingController _userIdController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 100.0),
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: new Container(
                child: new Image.asset(
                  "assets/images/logo_blue/logo_blue.png",
                  width: 151,
                  height: 47.5,
                ),
              ),
            ),
            const SizedBox(
              height: 35.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: new Text(
                "The best place for",
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: new Text(
                "healthier skin",
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: new Text(
                "Log in is required to use this service",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w100,
                    color: Colors.grey),
              ),
            ),
            const SizedBox(
              height: 70.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: TextField(
                controller: _userIdController,
                decoration: InputDecoration(
                    labelText: "Log In ID", hasFloatingPlaceholder: true),
              ),
            ),
            const SizedBox(
              height: 25.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: TextField(
                obscureText: true,
                controller: _passwordController,
                decoration: InputDecoration(
                    labelText: "Password", hasFloatingPlaceholder: true),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
                padding: const EdgeInsets.only(left: 40.0),
                alignment: Alignment.centerRight,
                child: Text(
                  "There is no account matching the information you entered. Please check again",
                  style: TextStyle(
                    color: Colors.redAccent,
                  ),
                )),
            const SizedBox(height: 50.0),
            Container(
              width: 255.0,
              height: 85,
              padding: EdgeInsets.only(left: 40.0, bottom: 10.0),
              child: RaisedButton(
                color: Colors.lightBlueAccent,
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0),
                ),
                onPressed: () {
                  _api.loginUser(_userIdController.text, _passwordController.text);},
                child: Center(
                  child: Icon(
                    Icons.arrow_forward,
                    size: 30.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
