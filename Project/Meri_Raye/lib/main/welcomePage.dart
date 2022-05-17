import 'package:flutter/material.dart';
import 'package:meri_raye/main/loginScreen.dart';
import 'package:meri_raye/main/signupScreen.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.fromLTRB(80.0, 250.0, 80.0, 50.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
                "Meri Raye",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF12492F),
                fontWeight: FontWeight.bold,
                fontSize: 50.0
              ),
            ),
            Text(
              "Share your views with the world",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            SizedBox(
              width: 250.0,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                },
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.grey,
                  primary: Color(0xFF12492F)
                ),
                child: Text('Sign In'),
              ),
            ),
          SizedBox(
            width: 250.0,
            child: OutlinedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
              },
              style: OutlinedButton.styleFrom(
                primary: Color(0xFF12492F),
                  side: BorderSide(width: 3.0, color: Color(0xFF12492F)),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),

              ),
              child: const Text("Sign Up", style: TextStyle(color: Colors.black),),
            ),
          ),
          ],
        ),
      ),
    );
  }
}
