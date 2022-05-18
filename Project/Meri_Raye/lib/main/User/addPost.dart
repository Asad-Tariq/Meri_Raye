import 'package:flutter/material.dart';

class AddPost extends StatefulWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  TextEditingController _post = TextEditingController();
  TextEditingController _title = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0xFF12492F),
        title: Text("Add A Review"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              child:Text("Add title", style: TextStyle(color: Color(0xFF12492F), fontWeight: FontWeight.bold, fontSize: 20.0),),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Material(
                child: TextFormField(
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.black),
                      contentPadding: EdgeInsets.all(20.0),
                      fillColor: Colors.white,
                      border: InputBorder.none
                  ),
                  controller: _title,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  cursorColor: Colors.black,
                ),
                borderRadius: BorderRadius.circular(15.0),
                elevation: 10.0,
                shadowColor: Color(0xFF12492F),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              height: 250,
              child: Material(
                child: TextFormField(
                  decoration: InputDecoration(
                      labelStyle: TextStyle(color: Colors.black),
                      hintText: 'Write a review...',
                      contentPadding: EdgeInsets.all(20.0),
                      hintStyle: TextStyle(color: Colors.grey[600], fontStyle: FontStyle.italic),
                      fillColor: Colors.white,
                      border: InputBorder.none
                  ),
                  controller: _post,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  cursorColor: Colors.black,
                ),
                borderRadius: BorderRadius.circular(15.0),
                elevation: 10.0,
                shadowColor: Color(0xFF12492F),
              ),
            ),
          Container(
            alignment: Alignment.centerLeft,
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 15.0, 7.5, 0.0),
                  width: 150,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      primary: Color(0xFF12492F),
                      minimumSize: Size(0, 45),
                      side: BorderSide(width: 3.0, color: Color(0xFF12492F)),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      ),

                    ),
                    child: const Text("REVIEW", style: TextStyle(color: Color(0xFF12492F),),),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(7.5, 15.0, 15.0, 0.0),
                  width: 150,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("CONFIRM", style: TextStyle(fontSize: 16.0), textAlign: TextAlign.center,),
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
              ],
            ),
          ),
          ],
        ),
      ),
    );
  }
}
