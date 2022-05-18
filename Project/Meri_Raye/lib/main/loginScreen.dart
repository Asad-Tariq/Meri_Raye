import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:meri_raye/Dashboard.dart';
import 'package:meri_raye/main/signupScreen.dart';
import 'package:meri_raye/main/Admin/adminDashboard.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Body());
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool _isChecked = false;
  bool _isValid = false;
  bool _isSwitched = false;
  bool _isObscure = true;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future login() async {
    var user_login_url = "http://192.168.100.116/meri-raye/api/user/login.php";
    var admin_login_url =
        "http://192.168.100.116/meri-raye/api/admin/login.php";
    var url = "";

    if (_isSwitched == true) {
      url = admin_login_url;
    } else {
      url = user_login_url;
    }

    http.Response response = await http.post(Uri.parse(url), body: {
      "email": _emailController.text,
      "password": _passwordController.text,
    });
    var data = json.decode(response.body);
    if (data == "Error") {
      Fluttertoast.showToast(
        msg: 'Invalid Credentials',
        fontSize: 12,
        textColor: Colors.white,
        backgroundColor: Colors.redAccent,
      );
    } else {
      Fluttertoast.showToast(
        msg: 'Successfully Logged In!',
        fontSize: 12,
        textColor: Colors.black,
        backgroundColor: Colors.greenAccent,
      );
      _isValid = true;
    }

    if (_isValid == true && _isSwitched == true) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const AdminDash()));
    } else if (_isValid == true && _isSwitched == false) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Dashboard()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      /// For the whole page
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(top: 8.0),
          child: Image.asset(
            "assets/images/sample.png",
            width: 90.0,
            height: 90.0,
          ),
        ),
        Center(
          /// Elevated container for login essentials
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 25.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Container(
                  height: 450.0,
                  margin: const EdgeInsets.fromLTRB(
                      10.0, 10.0, 10.0, 10.0), //Same as `blurRadius` i guess
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(1.0, 1.0),
                          blurRadius: 6.0,
                          spreadRadius: 2.0),
                    ],
                  ),
                  child: Center(
                    child: ListView(
                      /// for email, password etc.
                      children: <Widget>[
                        Container(
                            alignment: Alignment.centerLeft,
                            width: 300,
                            padding: const EdgeInsets.fromLTRB(
                                15.0, 20.0, 15.0, 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Material(
                              borderRadius: BorderRadius.circular(15.0),
                              child: TextFormField(
                                controller: _emailController,
                                onChanged: (value) {
                                  setState(() {});
                                },
                                cursorColor: Colors.black,
                                decoration: const InputDecoration(
                                    labelStyle: TextStyle(color: Colors.black),
                                    hintText: 'Email address',
                                    contentPadding: EdgeInsets.all(20.0),
                                    hintStyle: TextStyle(color: Colors.grey),
                                    fillColor: Colors.white,
                                    border: InputBorder.none),
                              ),
                              shadowColor: const Color(0xFF12492F),
                              elevation: 10.0,
                            )),
                        const SizedBox(
                          height: 15.0,
                        ),
                        Container(
                            alignment: Alignment.centerLeft,
                            width: 300,
                            padding: const EdgeInsets.fromLTRB(
                                15.0, 15.0, 15.0, 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Material(
                              borderRadius: BorderRadius.circular(15.0),
                              child: TextFormField(
                                controller: _passwordController,
                                onChanged: (value) {
                                  setState(() {});
                                },
                                cursorColor: Colors.black,
                                obscureText: _isObscure,
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      icon: Icon(_isObscure
                                          ? Icons.visibility
                                          : Icons.visibility_off),
                                      color: const Color(0xFF12492F),
                                      onPressed: () {
                                        setState(() {
                                          _isObscure = !_isObscure;
                                        });
                                      },
                                    ),
                                    labelStyle:
                                        const TextStyle(color: Colors.black),
                                    hintText: 'Password',
                                    contentPadding: const EdgeInsets.all(20.0),
                                    hintStyle:
                                        const TextStyle(color: Colors.grey),
                                    fillColor: Colors.white,
                                    border: InputBorder.none),
                              ),
                              shadowColor: const Color(0xFF12492F),
                              elevation: 10.0,
                            )),
                        const SizedBox(
                          width: 15.0,
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(
                                color: Color(0xFF12492F),
                              ),
                            )),
                        Row(
                          /// for toggle
                          children: <Widget>[
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Transform.scale(
                                scale: 0.8,
                                child: CupertinoSwitch(
                                  value: _isSwitched,
                                  onChanged: (value) {
                                    setState(() {
                                      _isSwitched = value;
                                    });
                                  },
                                  activeColor: const Color(0xFF12492F),
                                ),
                              ),
                            ),
                            const Text("Login as Moderator"),
                          ],
                        ),
                        Row(
                          /// for remember me
                          children: <Widget>[
                            Container(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Checkbox(
                                activeColor: const Color(0xFF12492F),
                                value: _isChecked,
                                onChanged: (value2) {
                                  _isChecked = value2!;
                                },
                              ),
                            ),
                            const Text("Remember Me", style: TextStyle()),
                          ],
                        ),
                        Container(
                          padding:
                              const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 10.0),
                          child: ElevatedButton(
                            onPressed: () {
                              login();
                            },
                            child: const Text(
                              "Sign In",
                              style: TextStyle(fontSize: 16.0),
                              textAlign: TextAlign.center,
                            ),
                            // style: ElevatedButton.styleFrom(
                            //   minimumSize: const Size(0, 45),
                            //   shadowColor: const Color(0xFF12492F),
                            //   shape: RoundedRectangleBorder(
                            //       borderRadius: BorderRadius.circular(15.0)),
                            //   primary: const Color(0xFF12492F),
                            // ),
                            style: ButtonStyle(
                              // primary: Color(0xFF12492F),
                              // side: BorderSide(width: 3.0, color: Color(0xFF12492F)),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xFF12492F)),
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding:
                              const EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text(
                                "Don't have an account?",
                                textAlign: TextAlign.center,
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const RegisterScreen()));
                                  },
                                  child: const Text(
                                    "Sign Up",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Color(0xFF12492F)),
                                  ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          ),
        ),
      ],
    );
  }
}
