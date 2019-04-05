import 'package:flutter/material.dart';
import 'package:flutter_floating_menu/floating_menu.dart';
import 'package:flutter_floating_menu/floating_menu_callback.dart';
import 'package:flutter_floating_menu/floating_menu_item.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Floatings'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    implements FloatingMenuCallback {
  String centerText = "Home";

  @override
  Widget build(BuildContext context) {
    final List<FloatingMenuItem> floatMenuList = [
      FloatingMenuItem(
          id: 1,
          icon: Icons.favorite,
          backgroundColor: Colors.deepOrangeAccent),
      FloatingMenuItem(id: 2, icon: Icons.map, backgroundColor: Colors.brown),
      FloatingMenuItem(
          id: 3, icon: Icons.email, backgroundColor: Colors.indigo),
      FloatingMenuItem(id: 4, icon: Icons.event, backgroundColor: Colors.pink),
      FloatingMenuItem(id: 5, icon: Icons.print, backgroundColor: Colors.green),
      FloatingMenuItem(
          id: 6, icon: Icons.home, backgroundColor: Colors.deepPurple),
    ];

    return Scaffold(
      resizeToAvoidBottomPadding: true,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: Text(
              centerText,
              style: TextStyle(color: Colors.black),
            ),
          ),
          FloatingMenu(
            menuList: floatMenuList,
            callback: this,
            btnBackgroundColor: Colors.black,
            preMenuIcon: Icons.add,
            postMenuIcon: Icons.clear,
          ),
        ],
      ),
    );
  }

  @override
  void onMenuClick(FloatingMenuItem floatingMenuItem) {
    print("onMenuClicked : " + floatingMenuItem.id.toString());
    switch (floatingMenuItem.id) {
      case 1:
        {
          centerText = "Favorite";
        }
        break;
      case 2:
        {
          centerText = "Map";
        }
        break;
      case 3:
        {
          centerText = "Email";
        }
        break;
      case 4:
        {
          centerText = "Event";
        }
        break;
      case 5:
        {
          centerText = "Print";
        }
        break;
      case 6:
        {
          centerText = "Home";
        }
        break;
    }

    setState(() {});
  }
}
