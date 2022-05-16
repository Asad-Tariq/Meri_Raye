import 'package:flutter/material.dart';
import 'package:meri_raye/main/roundedAppBar.dart';
import 'package:meri_raye/Dashboard.dart';
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{
  var email = 'test.user@gmail.com';
  var pass = '789456';
  TextEditingController em = TextEditingController();
  TextEditingController p = TextEditingController();
  @override
  Widget build(BuildContext context){
    double h1 = MediaQuery.of(context).size.height / 8;
    double w1 = (MediaQuery.of(context).size.width) / 4;

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
                  controller: em,
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
                  controller: p,
                ),
                SizedBox(height: 10.0),
                SizedBox(
                  width: 200.0,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Color(0xFF0A2F35)
                      ),
                      onPressed: (){
                        if ((em.text == email) && (p.text == pass)){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard()));
                        }
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
