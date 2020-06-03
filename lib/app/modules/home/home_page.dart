import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gamelist/app/utils/main_drawer.dart';
import 'package:gamelist/app/utils/routes.dart';

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
        actions: <Widget>[
          Builder(
            builder: (builderContext) {
              return FlatButton(
                textColor: Theme.of(context).buttonColor,
                child: Text('Logoff'),
                onPressed: () async {
                  FirebaseAuth _auth = FirebaseAuth.instance;
                  final FirebaseUser user =
                      await FirebaseAuth.instance.currentUser();
                  if (user == null) {
                    Scaffold.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Ninguem logado."),
                      ),
                    );
                    return;
                  }
                  await _auth.signOut();
                  final String uid = user.uid;
                  Scaffold.of(builderContext).showSnackBar(SnackBar(
                    content: Text(uid + 'Saiu com Sucesso'),
                  ));
                  Navigator.pushReplacementNamed(context, Routes.logon);
                },
              );
            },
          ),
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    return SingleChildScrollView(
      child: Container(
        width: 500,
        color: Colors.grey[400],
        child: Column(
          children: <Widget>[
            _inf("assets/images/HK1.jpg"),
            _img("assets/images/ORI1.jpg"),
          ],
        ),
      ),
    );
  }

  _img(String img) {
    return Image.asset(
      img,
      width: 400,
      height: 400,
    );
  }

  _inf(String img) {
    return Container(
      width: 500,
      height: 400,
      color: Colors.grey[400],
      child: Container(
        child: Column(
          children: <Widget>[
            _img(img),
          ],
        ),
      ),
    );
  }

  _text(String text) {
    return Text(text);
  }
}
