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
          Builder(builder: (BuilderContext) {

            return FlatButton(
              textColor: Theme.of(context).buttonColor,
              child: Text('Logoff'),
              onPressed: () async {
                FirebaseAuth _auth = FirebaseAuth.instance;
                final FirebaseUser user = await FirebaseAuth.instance.currentUser();
                if (user == null) {
                  Scaffold.of(context).showSnackBar(
                    const SnackBar(content: Text("Ninguem logado."),
                    ),
                  );
                  return;
                }
                await _auth.signOut();
                final String uid = user.uid;
                Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text(uid + 'Saiu com Sucesso'),
                      ));
                      Navigator.pushReplacementNamed(context, Routes.logon);
              }, 
              );
          },),
        ],
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}






