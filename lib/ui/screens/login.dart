import 'package:flutter/material.dart';
import 'package:flutter_gpskin/core/models/user.dart';
import 'package:flutter_gpskin/core/services/api.dart';
import 'package:flutter_gpskin/ui/screens/about_you.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final Api _api = new Api();
  final User _user = new User();
  TextEditingController _userIdController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final _formKey = new GlobalKey<FormState>();

  @override
  void dispose() {
    _userIdController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: NotificationListener<OverscrollIndicatorNotification>(
          // ignore: missing_return
          onNotification: (overscroll) {
            overscroll.disallowGlow();
          },
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
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
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.w400),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: new Text(
                    "healthier skin",
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.w400),
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
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'ID field Can\'t Be Empty';
                      }
                      return null;
                    },
                    controller: _userIdController,
                    decoration: InputDecoration(
                      labelText: "Log In ID",
                      hasFloatingPlaceholder: true,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Password field Can\'t Be Empty';
                      }
                      return null;
                    },
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: "Password",
                      hasFloatingPlaceholder: true,
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
                      visible: false,
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
                      if (_formKey.currentState.validate()) {
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (BuildContext context) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            });
                        _api.loginUser(_userIdController.text, _passwordController.text)
                            .then((value) {
                              if (value == 200) {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AboutScreen()),
                                      (Route<dynamic> route) => false,
                            );
                          } else Navigator.pop(context);
                        }).catchError((e) => null);
                      }
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
        ),
      ),
    );
  }
}
