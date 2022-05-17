import 'package:flutter/material.dart';
import 'package:meri_raye/main/loginScreen.dart';

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
        child: Container(
          width: double.infinity,
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 500),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(60),topRight: Radius.circular(60)),
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: [
                        const SizedBox(height: 40),
                        Container(
                          height: 50,
                          margin: const EdgeInsets.symmetric(horizontal: 50),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.green[800]
                          ),
                          child: Center(
                            child: ElevatedButton(
                              onPressed: (){},
                              child: Text("Sign in"),)
                          ),
                        ),
                      const SizedBox(height: 30),
                      const Text("Login with SNS",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold),),
                      const SizedBox(height: 30),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.blue
                              ),
                              child: const Center(
                                child: Text("Facebook",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                              ),
                            ),
                          ),
                          const SizedBox(width: 30),
                          Expanded(
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.black
                              ),
                              child: const Center(
                                child: Text("Github",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                              ),
                            ),
                          ),
                        ],
                      ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
          ),
        ),
      )
    );
  }
}
