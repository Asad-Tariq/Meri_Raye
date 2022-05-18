import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';


class AddPost extends StatefulWidget {

  String email;
  AddPost({required this.email,});

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final TextEditingController _post = TextEditingController();
  final TextEditingController _title = TextEditingController();

  String selectedName = '';
  List data = [];

  Future getBusinesses() async{
    var response = await http.get(Uri.parse("http://192.168.100.116/meri-raye/api/gen/get_businesses.php"));
    var jsonBody = response.body;
    var jsonData = (json.decode(jsonBody))['businesses'];

    setState(() {
      data = jsonData;
    });
    print('jsonData is = ${jsonData}');
    return "success";
  }

  bool _isValid = false;

  Future postReview() async{
    var url = "http://192.168.100.116/meri-raye/api/user/add_review.php";

    print('email = ${widget.email}');
    print('business = ${selectedName}');
    print('title = ${_title.text}');
    print('content = ${_post.text}');

    http.Response response = await http.post(Uri.parse(url), body: {
      "user_email": widget.email,
      "business_name": selectedName,
      "title": _title.text,
      "content": _post.text
    });

    var data = json.decode(response.body);
    if (data == "Error") {
      Fluttertoast.showToast(
        msg: 'Please fill in all fields',
        fontSize: 12,
        textColor: Colors.white,
        backgroundColor: Colors.redAccent,
      );
    } else {
      print('data = ${data}');
      Fluttertoast.showToast(
        msg: 'Review successfully added!',
        fontSize: 12,
        textColor: Colors.black,
        backgroundColor: Colors.greenAccent,
      );
      _isValid = true;
    }
  }

  @override
  void initState(){
    super.initState();
    getBusinesses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:const Color(0xFF12492F),
        title: const Text("Add A Review"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(10, 150, 10, 10),
        child: ListView(
          children: <Widget>[
            DecoratedBox(
                decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: const Color(0xFF12492F), width: 3),
                borderRadius: BorderRadius.circular(50),
                boxShadow: const <BoxShadow>[BoxShadow(color: Colors.grey, blurRadius: 5)]
              ),
              child: Center(
                child: DropdownButton<dynamic>(
                  value: null,
                  hint: const Text('Select Business',),
                  items: data.map((list){
                    return DropdownMenuItem(child: Text(list['name']), value: list['name'],);
                },).toList(),
                  onChanged: (value){
                    setState(() {
                      selectedName = value.toString();
                    });
                  },
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              child: Material(
                child: TextFormField(
                  decoration: InputDecoration(
                      labelStyle: const TextStyle(color: Colors.black),
                      contentPadding: const EdgeInsets.all(20.0),
                      hintText: 'Add a title...',
                      hintStyle: TextStyle(color: Colors.grey[600], fontStyle: FontStyle.italic),
                      fillColor: Colors.white,
                      border: InputBorder.none
                  ),
                  controller: _title,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  cursorColor: Colors.black,
                  onChanged: (value){
                    setState(() {});
                  },
                ),
                borderRadius: BorderRadius.circular(15.0),
                elevation: 10.0,
                shadowColor: const Color(0xFF12492F),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              height: 250,
              child: Material(
                child: TextFormField(
                  decoration: InputDecoration(
                      labelStyle: const TextStyle(color: Colors.black),
                      hintText: 'Write a review...',
                      contentPadding: const EdgeInsets.all(20.0),
                      hintStyle: TextStyle(color: Colors.grey[600], fontStyle: FontStyle.italic),
                      fillColor: Colors.white,
                      border: InputBorder.none
                  ),
                  controller: _post,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  cursorColor: Colors.black,
                  onChanged: (value){
                    setState(() {});
                  },
                ),
                borderRadius: BorderRadius.circular(15.0),
                elevation: 10.0,
                shadowColor: const Color(0xFF12492F),
              ),
            ),
          Container(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.fromLTRB(7.5, 15.0, 15.0, 0.0),
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {
                      postReview();
                    },
                    child: const Text("Post", style: TextStyle(fontSize: 12.0), textAlign: TextAlign.center,),
                    style: ButtonStyle(
                      // primary: Color(0xFF12492F),
                      // side: BorderSide(width: 3.0, color: Color(0xFF12492F)),
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xFF12492F)),
                      shape: MaterialStateProperty.all<
                          RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                    ),
                    // style: ElevatedButton.styleFrom(
                    //   minimumSize: const Size(0, 45),
                    //   shadowColor: const Color(0xFF12492F),
                    //   shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.circular(15.0)
                    //   ),
                    //   primary: const Color(0xFF12492F),
                    // ),
                  ),
                ),
              ],
            ),
          ),
          ],
        ),
      ),
    );
  }
}
