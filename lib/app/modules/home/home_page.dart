import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gamelist/app/utils/main_drawer.dart';
import 'package:gamelist/app/utils/routes.dart';

class HomePage extends StatefulWidget {
  final String title;

  static const String route = '/home';

  const HomePage({Key key, this.title = "Home / Sinopses"}) : super(key: key);

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
                  await _auth.signOut();

                  Navigator.pushReplacementNamed(context, Routes.logon);
                },
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child:  Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Card(
              color: Colors.grey[300], 
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    Image.asset("assets/images/ORI1.jpg"),
                    Divider(),
                    Text('\tEm Ori and the Blind Forest, o jogador controla um guardião espiritual feito de luz chamado Ori, um dos muitos filhos da Árvore do Espírito, que protegia a floresta de Nibel.\n\tDurante uma tempestade, Ori se desprende da árvore e se perde na floresta, quando é encontrado e adotado por uma criatura chamada Naru.'),
                  ],
                ),
              ),
            ),
            Card(
              color: Colors.grey[300], 
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    Image.asset("assets/images/HK2.jpg"),
                    Divider(),
                    Text('\tHollow Knight é um jogo indie desenvolvido pela iniciante Team Cherry, uma desenvolvedora australiana com apenas três pessoas. ... Formado pela mistura equilibrada de plataforma e combate, este jogo ganhou por merecer o apelido de Dark Souls indie, oferecendo ao jogador uma experiência desafiadora e extremamente prazerosa'),
                  ],
                ),
              ),
            ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}
