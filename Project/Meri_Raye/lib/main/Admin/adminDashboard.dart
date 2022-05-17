import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class AdminDash extends StatefulWidget {
  const AdminDash({Key? key}) : super(key: key);

  @override
  State<AdminDash> createState() => _AdminDashState();
}

class _AdminDashState extends State<AdminDash> {

  void alertInput(text, text2, text3){
    Alert(
        context: context,
        title: text,
        content: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.account_circle),
                labelText: text2,
              ),
            ),
          ],
        ),
        buttons: [
          DialogButton(
            onPressed: (){
              Navigator.pop(context);
              Alert(
                context: context,
                type: AlertType.success,
                title: "Success",
                desc: text3+" deleted!",
                buttons: [
                  DialogButton(
                    color: Color(0xFF12492F),
                    child: Text(
                      "CLOSE",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => AdminDash()));
                      //Navigator.push(context, MaterialPageRoute(builder: (context) => AdminDash()));
                    },
                    width: 120,
                  )
                ],
              ).show();
            },
            color: Color(0xFF12492F),
            child: Text(
              "CONFIRM",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          DialogButton(
            onPressed: () => Navigator.pop(context),
            color: Colors.redAccent,
            child: Text(
              "CANCEL",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          )
        ]).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF12492F),
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[
             SizedBox(
               width: 250.0,
               height: 50,
               child: ElevatedButton(
                 onPressed: () {
                   String text = 'Enter User ID';
                   alertInput(text, "User ID", "User");
                 },
                 style: ElevatedButton.styleFrom(
                     shadowColor: Colors.grey,
                     primary: Color(0xFF12492F)
                 ),
                 child: Text('Delete User', style: TextStyle(fontSize: 20),),
               ),
             ),
             SizedBox(height: 25,),
             SizedBox(
               height: 50,
               width: 250.0,
               child: OutlinedButton(
                 onPressed: () {
                   String text = 'Enter Review ID';
                   alertInput(text, "Review ID", "Review");
                 },
                 style: OutlinedButton.styleFrom(
                   primary: Color(0xFF12492F),
                   side: BorderSide(width: 3.0, color: Color(0xFF12492F)),
                   shape: const RoundedRectangleBorder(
                     borderRadius: BorderRadius.all(Radius.circular(5)),
                   ),
                 ),
                 child: const Text("Delete Review", style: TextStyle(fontSize: 20 ,color: Color(0xFF12492F)),),
               ),
             ),
           ],
          ),
        ),
      )
    );
  }
}
