import 'package:flutter/material.dart';

class AddPost extends StatefulWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0xFF12492F),
        title: Text("Add A Review"),
        centerTitle: true,
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              color: Colors.grey,
              child: TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
            )
          ],
        ),
      ),
    );
  }
}
