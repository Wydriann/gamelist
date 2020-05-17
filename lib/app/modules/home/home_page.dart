import 'package:flutter/material.dart';
import 'package:gamelist/app/utils/main_drawer.dart';


class HomePage extends StatefulWidget {
  final String title;

  static const String route = '/home';

  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}






