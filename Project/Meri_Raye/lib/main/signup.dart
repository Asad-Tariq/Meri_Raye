import 'package:flutter/material.dart';
import 'package:meri_raye/main/roundedAppBar.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>{
  var username, password, token;
  @override
  Widget build(BuildContext context){
    double h1 = MediaQuery.of(context).size.height / 8;
    double w1 = (MediaQuery.of(context).size.width) / 4;
    double hsmall = MediaQuery.of(context).size.height / 20;
    double wsmall = MediaQuery.of(context).size.width / 5;

    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: RoundedAppBar('Sign In'),
          body: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.fromLTRB(w1/2, 0, w1/2, h1/2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    labelStyle: TextStyle(
                      fontFamily: 'SanFrancisco',
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0A2F35),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                  onChanged: (val){
                    username = val;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    labelStyle: TextStyle(
                      fontFamily: 'SanFrancisco',
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0A2F35),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                  onChanged: (val){
                    username = val;
                  },
                ),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                        fontFamily: 'SanFrancisco',
                        fontWeight: FontWeight.bold,
                        fontSize: 15.0,
                        color: Color(0xFF0A2F35),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      )
                  ),
                  onChanged: (val){
                    password = val;
                  },
                ),
                SizedBox(height: 10.0),
                SizedBox(
                  width: 200.0,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xFF0A2F35)
                      ),
                      onPressed: (){
                      },
                      child: Text('Login')
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
