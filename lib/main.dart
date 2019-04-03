import 'package:floatings/model/FloatModel.dart';
import 'package:floatings/utils/Toast.dart';
import 'package:flutter/material.dart';

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
    with SingleTickerProviderStateMixin {
  bool isFloatClicked = false;
  AnimationController controller;
  Animation<Offset> offset;
  List<FloatModel> floatList = [];
  String centerText = "Floating";

  @override
  void initState() {
    super.initState();
    _prepareFloatingList();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));

    offset = Tween<Offset>(begin: Offset.zero, end: Offset(2.0, 0.0))
        .animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: <Widget>[
          Center(
            child: Text(centerText),
          ),
          Positioned(
            right: 16,
            bottom: 16,
            child: Column(
              children: <Widget>[
                Container(
                  child: _showFloatingOptions(),
                  height: 300,
                  width: 60,
                  padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
                ),
                FloatingActionButton(
                  onPressed: () {
                    _changeFloatingVisibility();
                  },
                  child: isFloatClicked ? Icon(Icons.done) : Icon(Icons.add),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void _changeFloatingVisibility() {
    isFloatClicked = !isFloatClicked;
    setState(() {});
  }

  Widget _showFloatingOptions() {
    if (isFloatClicked) {
      controller.reverse();
    } else {
      controller.forward();
    }

    return SlideTransition(
      transformHitTests: true,
      position: offset,
      child: ListView.builder(
        itemCount: floatList.length,
        itemBuilder: (BuildContext context, int index) {
          var model = floatList[index];
          return FloatingActionButton(
            onPressed: () {
              centerText = model.name;
              _changeFloatingVisibility();
              //Toast(model.name);
            },
            child: Icon(model.icon),
          );
        },
      ),
    );
  }

  void _prepareFloatingList() {
    floatList.clear();
    floatList.add(FloatModel(id: 1, icon: Icons.email, name: "Email"));
    floatList.add(FloatModel(id: 2, icon: Icons.favorite, name: "Favorite"));
    floatList.add(FloatModel(id: 3, icon: Icons.home, name: "Home"));
    floatList.add(FloatModel(id: 4, icon: Icons.event, name: "Event"));
    floatList.add(FloatModel(id: 5, icon: Icons.map, name: "Map"));
  }
}
