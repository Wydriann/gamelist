import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gamelist/app/modules/home/home_module.dart';
import 'package:gamelist/app/modules/logon/logon_page.dart';
import 'package:gamelist/app/utils/routes.dart';

import 'modules/games/games_page.dart';
import 'modules/genres/genres_page.dart';
import 'modules/home/home_page.dart';
import 'utils/routes.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        Routes.home: (context) => HomePage(),
        Routes.genre: (context) => GenresPage(),
        Routes.games: (context) => GamesPage(),
      },
      title: 'Flutter Slidy',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StreamBuilder<Object>(
        stream: FirebaseAuth.instance.onAuthStateChanged,
        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.active) {
           FirebaseUser user = snapshot.data;

           if (user == null) {
             return LogonPage();
           } 
           return HomeModule();
          } else {
            return Scaffold(
              body: Center(child: CircularProgressIndicator(),
              ),
            );
            //esperar
          }
          
        }
      ),
    );
  }
}
