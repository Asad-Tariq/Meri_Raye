import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meri_raye/main/viewReview.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dashboard",
      debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("Meri Raye", textAlign: TextAlign.center,),
            centerTitle: true,
            automaticallyImplyLeading: true,
            backgroundColor: Color(0xFF0A2F35),),
          drawer: DrawerWork(),
          body: NewsFeed(),
          bottomNavigationBar: BottomNavigation(),

          ),
        );
  }
}

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: search',
      style: optionStyle,
    ),
    Text(
      'Index 2: review',
      style: optionStyle,
    ),
    Text(
      'Index 3: message',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xFF0A2F35),
      selectedItemColor: Color(0xFFF56038),
      unselectedItemColor: Colors.white,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',

        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.post_add),
          label: 'Write Review',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message,),
          label: 'Message',
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
    );
  }
}


class DrawerWork extends StatefulWidget {
  const DrawerWork({Key? key}) : super(key: key);

  @override
  State<DrawerWork> createState() => _DrawerWorkState();
}

class _DrawerWorkState extends State<DrawerWork> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
                accountName: Text("Test User"),
                currentAccountPicture: Icon(
                  Icons.account_box_rounded,
                  color: Colors.white,
                  size: 70.0,
                ),
                accountEmail: Text('test.user@gmail.com', textAlign: TextAlign.center,),
                decoration: BoxDecoration(
                  color: Color(0xFF0A2F35),)
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // if you need this
                side: BorderSide(
                  color: Color(0xFF0A2F35),
                  width: 1,
                ),
              ),
              child: ListTile(
                leading: Icon(CupertinoIcons.profile_circled, color: Colors.black, size: 40.0,),
                title: Text('Manage Profile', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // if you need this
                side: BorderSide(
                  color: Color(0xFF0A2F35),
                  width: 1,
                ),
              ),
              child: ListTile(
                leading: Icon(Icons.local_activity, color: Colors.black, size: 40.0,),
                title: Text('Your Activity', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // if you need this
                side: BorderSide(
                  color: Color(0xFF0A2F35),
                  width: 1,
                ),
              ),
              child: ListTile(
                leading: Icon(Icons.post_add, color: Colors.black, size: 40.0,),
                title: Text('Your Posts', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // if you need this
                side: BorderSide(
                  color: Color(0xFF0A2F35),
                  width: 1,
                ),
              ),
              child: ListTile(
                leading: Icon(Icons.connect_without_contact, color: Colors.black, size: 40.0,),
                title: Text('Connections', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // if you need this
                side: BorderSide(
                  color: Color(0xFF0A2F35),
                  width: 1,
                ),
              ),
              child: ListTile(
                leading: Icon(Icons.help, color: Colors.black, size: 40.0,),
                title: Text('Help', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // if you need this
                side: BorderSide(
                  color: Color(0xFF0A2F35),
                  width: 1,
                ),
              ),
              child: ListTile(
                leading: Icon(Icons.feedback, color: Colors.black, size: 40.0,),
                title: Text('Feedback', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
              ),
            ),
          ]
      ),
    );
  }
}


class NewsFeed extends StatefulWidget {
  const NewsFeed({Key? key}) : super(key: key);

  @override
  State<NewsFeed> createState() => _NewsFeedState();
}

class _NewsFeedState extends State<NewsFeed> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
          children: [
            Column(
              children: [
                Flexible(child: Container(
                  height: 300,
                  width: 200,
                  child: Card(
                      elevation: 8.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          InkWell(
                            splashColor: Colors.blue.withAlpha(30),
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ViewReview()));
                            },
                            child: Image.asset("assets/images/kaybees.jpg"),
                          ),
                          Text("Review Kaybees", style: TextStyle(fontWeight: FontWeight.bold),),
                          Text("Dated: 26th April 2022", style: TextStyle(fontWeight: FontWeight.bold),),
                        ],
                      )
                  ),
                ),),
                Flexible(child: Container(
                  height: 300,
                  width: 200,
                  child: Card(
                      elevation: 8.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          InkWell(
                            splashColor: Colors.blue.withAlpha(30),
                            onTap: () {},
                            child: Image.asset("assets/images/foodpanda.png"),
                          ),
                          Text("Review Foodpanda", style: TextStyle(fontWeight: FontWeight.bold),),
                          Text("Dated: 26th April 2022", style: TextStyle(fontWeight: FontWeight.bold),),
                        ],
                      )
                  ),
                ),),
              ],
            ),
            Column(
              children: [
                Flexible(child: Container(
                  height: 300,
                  width: 200,
                  child: Card(
                      elevation: 8.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          InkWell(
                            splashColor: Colors.blue.withAlpha(30),
                            onTap: () {},
                            child: Image.asset("assets/images/bbq.jpeg"),
                          ),
                          Text("Review BBQ Tonight", style: TextStyle(fontWeight: FontWeight.bold),),
                          Text("Dated: 24th April 2022", style: TextStyle(fontWeight: FontWeight.bold),),
                        ],
                      )
                  ),
                ),),
                Flexible(child: Container(
                  height: 300,
                  width: 200,
                  child: Card(
                      elevation: 8.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          InkWell(
                            splashColor: Colors.blue.withAlpha(30),
                            onTap: () {},
                            child: Image.asset("assets/images/pizza.jpg"),
                          ),
                          Text("Review Pizza Hut", style: TextStyle(fontWeight: FontWeight.bold),),
                          Text("Dated: 24th April 2022", style: TextStyle(fontWeight: FontWeight.bold),),
                        ],
                      )
                  ),
                ),),
              ],
            )
          ],
        )
    );
  }
}

