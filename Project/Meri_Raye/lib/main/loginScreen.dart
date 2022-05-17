import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:meri_raye/Dashboard.dart';
import 'package:meri_raye/main/signupScreen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
  var email = 'test.user@gmail.com';
  var pass = '789456';
  bool _isChecked = false;
  bool isSwitched = false;
  bool _isObscure = true;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

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
                  margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0), //Same as `blurRadius` i guess
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
                      /// for email, password etc.
                      children: <Widget>[
                        Container(
                            alignment: Alignment.centerLeft,
                            width: 300,
                            padding: EdgeInsets.fromLTRB(15.0, 20.0, 15.0, 10.0),
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
                        SizedBox(height: 15.0,),
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
                                    hintText: 'Password',
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
                        TextButton(onPressed: (){},
                            child: Text("Forgot Password?", style: TextStyle(color: Color(0xFF12492F),),)
                        ),
                        Row(
                          /// for toggle
                          children: <Widget>[
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: 15.0),
                              child: Transform.scale(
                                scale: 0.8,
                                child: CupertinoSwitch(
                                  value: isSwitched,
                                  onChanged: (value) {
                                    setState(() {
                                      isSwitched = value;
                                    });
                                  },
                                  activeColor: Color(0xFF12492F),
                                ),
                              ),
                            ),
                            Text("Login as Moderator"),
                          ],
                        ),
                        Row(
                          /// for remember me
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(left: 15.0),
                              child: Checkbox(
                                activeColor: Color(0xFF12492F),
                                value: _isChecked,
                                onChanged: (value2) {
                                  _isChecked = value2!; },
                              ),
                            ),
                            Text("Remember Me",
                                style: TextStyle(
                                )),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 10.0),
                          child: ElevatedButton(
                            onPressed: () {
                              if (_emailController.text == email && _passwordController.text == pass){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
                              }
                            },
                            child: Text("Sign In", style: TextStyle(fontSize: 16.0), textAlign: TextAlign.center,),
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("Don't have an account?", textAlign: TextAlign.center,),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
                                  },
                                  child: Text("Sign Up",textAlign: TextAlign.center ,style: TextStyle(color: Color(0xFF12492F)),))
                            ],
                          ),
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

