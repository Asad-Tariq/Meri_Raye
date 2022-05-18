import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class AdminDash extends StatefulWidget {
  const AdminDash({Key? key}) : super(key: key);

  @override
  State<AdminDash> createState() => _AdminDashState();
}

class _AdminDashState extends State<AdminDash> {

  TextEditingController _idController = TextEditingController();
  bool _isDeleted = false;

  Future delete(String s) async {

    print('text of id box = ${_idController.text}');

    // final queryParameters = {
    //   'entity_id': _idController.text,
    //   'table_name': s,
    // };

    var uri = Uri.parse('http://192.168.100.116/meri-raye/api/admin/removal.php?entity_id='+_idController.text+'&table_name='+s);

    http.Response response = await http.get(uri);

    var data = (json.decode(response.body));

    if (data == "Specify entity to delete!"){
      Fluttertoast.showToast(
          msg: 'Entity not given',
          fontSize: 12,
          backgroundColor: Colors.red,
          textColor: Colors.white
      );

    } else if (data == "Internal Server Error!") {
      Fluttertoast.showToast(
          msg: 'ID does not match',
          fontSize: 12,
          backgroundColor: Colors.red,
          textColor: Colors.white
      );

    } else if (data == "Entity deleted successfully!"){
      Alert(
        context: context,
        type: AlertType.success,
        title: "Success",
        desc:  "Entity deleted!",
        buttons: [
          DialogButton(
            color: const Color(0xFF12492F),
            child: const Text(
              "CLOSE",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (
                      context) => const AdminDash()));
            },
            width: 120,
          )
        ],
      ).show();
      _isDeleted = true;
    }

  }

  void alertInput(text, text2, text3, text4){
    Alert(
        context: context,
        title: text,
        content: Column(
          children: <Widget>[
            TextFormField(
              controller: _idController,
              onChanged: (value){
                setState(() {});
              },
              decoration: InputDecoration(
                icon: const Icon(Icons.account_circle),
                labelText: text2,
              ),
            ),
          ],
        ),
        buttons: [
          DialogButton(
            onPressed: () {
              delete(text4);
              if (_isDeleted == true) {
                Navigator.pop(context);
              }
            },
            color: const Color(0xFF12492F),
            child: const Text(
              "CONFIRM",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          DialogButton(
            onPressed: () => Navigator.pop(context),
            color: Colors.redAccent,
            child: const Text(
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
        backgroundColor: const Color(0xFF12492F),
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
                   String table = 'users';
                   alertInput(text, "User ID", "User", table);
                 },
                 style: ElevatedButton.styleFrom(
                     shadowColor: Colors.grey,
                     primary: const Color(0xFF12492F)
                 ),
                 child: const Text('Delete User', style: TextStyle(fontSize: 20),),
               ),
             ),
             const SizedBox(height: 25,),
             SizedBox(
               height: 50,
               width: 250.0,
               child: OutlinedButton(
                 onPressed: () {
                   String text = 'Enter Review ID';
                   String table = 'reviews';
                   alertInput(text, "Review ID", "Review", table);
                 },
                 style: OutlinedButton.styleFrom(
                   primary: const Color(0xFF12492F),
                   side: const BorderSide(width: 3.0, color: Color(0xFF12492F)),
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
