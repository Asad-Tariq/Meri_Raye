import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meri_raye/Dashboard.dart';

class ViewReview extends StatefulWidget {
  const ViewReview({Key? key}) : super(key: key);

  @override
  State<ViewReview> createState() => _ViewReviewState();
}

class _ViewReviewState extends State<ViewReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(),
      appBar: AppBar(backgroundColor: Color(0xFF0A2F35),),
      body: Container(
        child: Column(
          children: <Widget>[
            SizedBox(height: 10.0,),
            Container(
              height: 100.0,
              padding: EdgeInsets.only(top: 10.0),
              child: Card(
                shadowColor: Colors.grey,
                child: SizedBox(
                  child: Row(
                    children: <Widget>[
                      SizedBox(width: 10.0,),
                      Icon(Icons.account_box, size: 50.0,),
                      SizedBox(width: 10.0,),
                      Text("Reviewer"),
                      SizedBox(width: 50.0,),
                      Icon(Icons.pin_drop, size: 45.0,),
                      SizedBox(width: 10.0,),
                      Text("Location")
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),

            ),
    );
  }
}
