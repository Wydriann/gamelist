import 'package:flutter/material.dart';
import 'package:gamelist/app/utils/main_drawer.dart';

class GenresPage extends StatefulWidget {
  final String title;

  static const String route = '/genres';

  const GenresPage({Key key, this.title = "Genres"}) : super(key: key);

  @override
  _GenresPageState createState() => _GenresPageState();
}

class _GenresPageState extends State<GenresPage> {
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
