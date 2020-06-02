import 'package:flutter/material.dart';
import 'package:flutter_gpskin/core/services/api.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final Api _api = new Api();
  TextEditingController _userIdController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  bool _loginState = false;
  bool _validateId = false;
  bool _validatePassword = false;

  @override
  void dispose() {
    _userIdController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
                  labelText: "Log In ID",
                  hasFloatingPlaceholder: true,
                  errorText: _validateId ? 'ID field Can\'t Be Empty' : null,
                ),
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
                  labelText: "Password",
                  hasFloatingPlaceholder: true,
                  errorText: _validatePassword ? 'Password field Can\'t Be Empty' : null,
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Container(
                padding: const EdgeInsets.only(left: 40.0),
                alignment: Alignment.centerRight,
                child: Visibility(
                  visible: _loginState,
                  child: Text(
                    "There is no account matching the information you entered. Please check again",
                    style: TextStyle(
                      color: Colors.redAccent,
                    ),
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
                  setState(() {
                    if(_userIdController.text.isEmpty == false){
                      _validateId = false;
                      if(_passwordController.text.isEmpty == false){
                        _validatePassword = false;
                        _api.loginUser(_userIdController.text, _passwordController.text).then((value) {
                          value == 200 ? _loginState = false : _loginState = true;
                        });
                      } else _validatePassword = true;
                    } else _validateId = true;
//                    _text.text.isEmpty ? _validate = true : _validate = false;
                  });
                },
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
