import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:meri_raye/Dashboard.dart';
import 'package:meri_raye/main/loginScreen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
        ),
        body: Body());
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // Password validation
  bool validateStructure(String value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');

    if (!value.isEmpty) {
      if (regex.hasMatch(value)) {
        // password conforms to rules
        return true;
      } else {
        // password does not conform to rules
        return false;
      }
    } else {
      // empty string
      return false;
    }
  }

  bool _isValid = false;
  bool isSwitched = false;
  bool _isObscure = true;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();

  Future register() async {
    var url = "http://192.168.100.116/meri-raye/api/user/register.php";
    http.Response response = await http.post(Uri.parse(url), body: {
      "name": _nameController.text,
      "email": _emailController.text,
      "password": _passwordController.text,
      "description": _descriptionController.text,
    });
    var data = json.decode(response.body);
    if (data == "Email already exists!") {
      Fluttertoast.showToast(
        msg: 'Email already exists! Choose a new one',
        fontSize: 12,
        textColor: Colors.white,
        backgroundColor: Colors.redAccent,
      );
    } else if (data == "Internal Server Error") {
      Fluttertoast.showToast(
        msg: 'Registration Unsuccessful. Server Error!',
        fontSize: 12,
        textColor: Colors.white,
        backgroundColor: Colors.redAccent,
      );
    } else {
      Fluttertoast.showToast(
        msg: 'Registration Successful!',
        fontSize: 12,
        textColor: Colors.black,
        backgroundColor: Colors.greenAccent,
      );
      _isValid = true;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Dashboard(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      /// For the whole page
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 8.0),
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
                  height: 480.0,
                  margin: const EdgeInsets.fromLTRB(
                      10.0, 8.0, 10.0, 10.0), //Same as `blurRadius` i guess
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(1.0, 1.0),
                          blurRadius: 6.0,
                          spreadRadius: 2.0),
                    ],
                  ),
                  child: Center(
                    child: ListView(
                      /// for name, email, password etc.
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Already have an account?"),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage()));
                                  },
                                  child: Text(
                                    "Sign In",
                                    style: TextStyle(color: Color(0xFF12492F)),
                                  ))
                            ],
                          ),
                        ),
                        Container(
                            alignment: Alignment.centerLeft,
                            width: 250,
                            padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Material(
                              borderRadius: BorderRadius.circular(15.0),
                              child: TextFormField(
                                controller: _nameController,
                                onChanged: (value) {
                                  setState(() {});
                                },
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                    labelStyle: TextStyle(color: Colors.black),
                                    hintText: 'Full Name',
                                    contentPadding: EdgeInsets.all(20.0),
                                    hintStyle: TextStyle(color: Colors.grey),
                                    fillColor: Colors.white,
                                    border: InputBorder.none),
                              ),
                              shadowColor: Color(0xFF12492F),
                              elevation: 10.0,
                            )),
                        Container(
                            alignment: Alignment.centerLeft,
                            width: 250,
                            padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
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
                                decoration: InputDecoration(
                                    labelStyle: TextStyle(color: Colors.black),
                                    hintText: 'Email Address',
                                    contentPadding: EdgeInsets.all(20.0),
                                    hintStyle: TextStyle(color: Colors.grey),
                                    fillColor: Colors.white,
                                    border: InputBorder.none),
                              ),
                              shadowColor: Color(0xFF12492F),
                              elevation: 10.0,
                            )),
                        Container(
                            alignment: Alignment.centerLeft,
                            width: 300,
                            padding:
                                EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 10.0),
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
                                      color: Color(0xFF12492F),
                                      onPressed: () {
                                        setState(() {
                                          _isObscure = !_isObscure;
                                        });
                                      },
                                    ),
                                    labelStyle: TextStyle(color: Colors.black),
                                    hintText: 'Set Password',
                                    contentPadding: EdgeInsets.all(20.0),
                                    hintStyle: TextStyle(color: Colors.grey),
                                    fillColor: Colors.white,
                                    border: InputBorder.none),
                              ),
                              shadowColor: Color(0xFF12492F),
                              elevation: 10.0,
                            )),
                        Container(
                            alignment: Alignment.centerLeft,
                            width: 300,
                            padding:
                                EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Material(
                              borderRadius: BorderRadius.circular(15.0),
                              child: TextFormField(
                                controller: _descriptionController,
                                onChanged: (value) {
                                  setState(() {});
                                },
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                    labelStyle: TextStyle(color: Colors.black),
                                    hintText: 'Add Description',
                                    contentPadding: EdgeInsets.all(20.0),
                                    hintStyle: TextStyle(color: Colors.grey),
                                    fillColor: Colors.white,
                                    border: InputBorder.none),
                              ),
                              shadowColor: Color(0xFF12492F),
                              elevation: 10.0,
                            )),
                        SizedBox(
                          width: 15.0,
                        ),
                        // Container(
                        //   padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 2.0),
                        //   child: Text('Please note: Password should contain at least one character, one upper case letter, one lower case and one number.'),
                        // ),
                        Container(
                          padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
                          child: ElevatedButton(
                            onPressed: () {
                              // validate email
                              bool emailValid = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(_emailController.text);
                              int count = 0;
                              if ((validateStructure(
                                      _passwordController.text)) ==
                                  false) {
                                count++;
                              }
                              if (emailValid == false) {
                                count++;
                              }

                              if (count == 0) {
                                register();
                                if (_isValid == true) {
                                  print('val = ${_isValid}');
                                  Alert(
                                    context: context,
                                    type: AlertType.success,
                                    title: "SUCCESS",
                                    desc: "Account created",
                                    buttons: [
                                      DialogButton(
                                        child: Text(
                                          "Proceed",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                        onPressed: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Dashboard())),
                                        width: 120,
                                        color: Color(0xFF12492F),
                                      )
                                    ],
                                  ).show();
                                }
                              } else {
                                Fluttertoast.showToast(
                                  msg: 'Enter valid credentials!',
                                  fontSize: 12,
                                  textColor: Colors.white,
                                  backgroundColor: Colors.redAccent,
                                );
                              }
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(fontSize: 16.0),
                              textAlign: TextAlign.center,
                            ),
                            // style: ElevatedButton.styleFrom(
                            //   minimumSize: Size(0, 45),
                            //   shadowColor: Color(0xFF12492F),
                            //   shape: RoundedRectangleBorder(
                            //       borderRadius: BorderRadius.circular(15.0)),
                            //   primary: Color(0xFF12492F),
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
                          padding: EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0.0),
                          child: Text("By Signing up you are agreeing to our",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF12492F),
                              )),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                          child: TextButton(
                              onPressed: () {},
                              child: Text(
                                "Terms Conditions & Privacy Policy",
                                style: TextStyle(color: Color(0xFF12492F)),
                                textAlign: TextAlign.center,
                              )),
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
