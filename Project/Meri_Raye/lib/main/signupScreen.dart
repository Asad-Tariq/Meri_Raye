import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:meri_raye/Dashboard.dart';
import 'package:meri_raye/main/loginScreen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.white,),
        body: Body()
    );
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  /// Password validation
  bool validateStructure(String value){
    String  pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    return regExp.hasMatch(value);
  }
  var email = 'test.user@gmail.com';
  var pass = '789456';
  bool _isChecked = false;
  bool isSwitched = false;
  bool _isObscure = true;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ListView(
      /// For the whole page
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 8.0),
          child: Image.asset("assets/images/sample.png", width: 90.0, height: 90.0,),
        ),
        Center(
          /// Elevated container for login essentials
          child: Padding(
            padding: const EdgeInsets.fromLTRB(25.0, 0.0, 25.0, 25.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Container(
                  height: 450.0,
                  margin: const EdgeInsets.fromLTRB(10.0, 8.0, 10.0, 10.0), //Same as `blurRadius` i guess
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(2.0, 2.0),
                          blurRadius: 6.0,
                          spreadRadius: 2.0
                      ),
                    ],
                  ),
                  child: Center(
                    child: ListView(
                      /// for name, email, password etc.
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                          child: Row(
                            children: <Widget>[
                              Text("Already have an account?"),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                                  },
                                  child: Text("Sign In", style: TextStyle(color: Color(0xFF12492F)),))
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
                                  setState(() {
                                  });
                                },
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                    labelStyle: TextStyle(color: Colors.black),
                                    hintText: 'Full Name',
                                    contentPadding: EdgeInsets.all(20.0),
                                    hintStyle: TextStyle(color: Colors.grey),
                                    fillColor: Colors.white,
                                    border: InputBorder.none
                                ),
                              ),
                              shadowColor: Color(0xFF12492F),
                              elevation: 10.0,
                            )
                        ),
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
                                  setState(() {
                                  });
                                },
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                    labelStyle: TextStyle(color: Colors.black),
                                    hintText: 'Email address',
                                    contentPadding: EdgeInsets.all(20.0),
                                    hintStyle: TextStyle(color: Colors.grey),
                                    fillColor: Colors.white,
                                    border: InputBorder.none
                                ),
                              ),
                              shadowColor: Color(0xFF12492F),
                              elevation: 10.0,
                            )
                        ),
                        Container(
                            alignment: Alignment.centerLeft,
                            width: 300,
                            padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Material(
                              borderRadius: BorderRadius.circular(15.0),
                              child: TextFormField(
                                controller: _passwordController,
                                onChanged: (value) {
                                  setState(() {
                                  });
                                },
                                cursorColor: Colors.black,
                                obscureText: _isObscure,
                                decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                      icon: Icon(_isObscure ? Icons.visibility : Icons
                                          .visibility_off),
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
                                    border: InputBorder.none
                                ),
                              ),
                              shadowColor: Color(0xFF12492F),
                              elevation: 10.0,
                            )
                        ),
                        SizedBox(width: 15.0,),
                        Container(
                          padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 10.0),
                          child: Text('Password should contain at least one character, one upper case letter, one lower case and one number.'),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 0.0),
                          child: ElevatedButton(
                            onPressed: () {
                              bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(_emailController.text);
                              int count = 0;
                              if ((validateStructure(_passwordController.text)) == false){
                                count++;
                              }
                              if (emailValid == false){
                                count++;
                              }
                              if (count == 0){
                                Alert(
                                  context: context,
                                  type: AlertType.success,
                                  title: "SUCCESS",
                                  desc: "Account created",
                                  buttons: [
                                    DialogButton(
                                      child: Text(
                                        "Proceed",
                                        style: TextStyle(color: Colors.white, fontSize: 20),
                                      ),
                                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard())),
                                      width: 120,
                                      color: Color(0xFF12492F),
                                    )
                                  ],
                                ).show();
                              }
                              else {
                                if (count == 2){
                                  Alert(
                                    context: context,
                                    type: AlertType.error,
                                    title: "ERROR",
                                    desc: "Password and Email Incorrect",
                                    buttons: [
                                      DialogButton(
                                        child: Text(
                                          "OK",
                                          style: TextStyle(color: Colors.white, fontSize: 20),
                                        ),
                                        onPressed: () => Navigator.pop(context),
                                        width: 120,
                                        color: Color(0xFF12492F),
                                      )
                                    ],
                                  ).show();
                                }
                                else{
                                  if (emailValid == false){
                                    Alert(
                                      context: context,
                                      type: AlertType.error,
                                      title: "ERROR",
                                      desc: "Email Incorrect",
                                      buttons: [
                                        DialogButton(
                                          child: Text(
                                            "OK",
                                            style: TextStyle(color: Colors.white, fontSize: 20),
                                          ),
                                          onPressed: () => Navigator.pop(context),
                                          width: 120,
                                          color: Color(0xFF12492F),
                                        )
                                      ],
                                    ).show();
                                  }
                                  else{
                                    Alert(
                                      context: context,
                                      type: AlertType.error,
                                      title: "ERROR",
                                      desc: "Password Format Incorrect",
                                      buttons: [
                                        DialogButton(
                                          child: Text(
                                            "OK",
                                            style: TextStyle(color: Colors.white, fontSize: 20),
                                          ),
                                          onPressed: () => Navigator.pop(context),
                                          width: 120,
                                          color: Color(0xFF12492F),
                                        )
                                      ],
                                    ).show();
                                  }
                                }

                              }
                            },
                            child: Text("SIGN UP", style: TextStyle(fontSize: 16.0), textAlign: TextAlign.center,),
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(0, 45),
                              shadowColor: Color(0xFF12492F),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0)
                              ),
                              primary: Color(0xFF12492F),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                          child: Text("By Signing up you are agreeing to our",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Color(0xFF12492F),)),
                        ),
                        Container(
                          padding:EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
                          child: TextButton(
                              onPressed: () {},
                              child: Text("Terms Conditions & Privacy Policy",
                                style: TextStyle(
                                    color: Color(0xFF12492F)),
                                textAlign: TextAlign.center,
                              )),
                        ),
                      ],
                    ),
                  )
              ),
            ),
          ),
        ),
      ],
    );
  }
}

