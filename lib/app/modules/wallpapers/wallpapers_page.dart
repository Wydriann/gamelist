import 'package:flutter/material.dart';
import 'package:gamelist/app/utils/main_drawer.dart';

class WallpapersPage extends StatefulWidget {
  static const String route = '/wallpappers';

  @override
  _WallpapersPageState createState() =>   _WallpapersPageState();
}
class _WallpapersPageState extends State<WallpapersPage>{
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      drawer: MainDrawer(),
      appBar:   AppBar(
        title:   Text('Papeis de Parede'),
        centerTitle :  true,
        backgroundColor: Colors.blue,
      ),
      body: _body(),
          );
      
        }
      
       _body(){
    return SingleChildScrollView(
      padding: EdgeInsets.all(10.0),
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
                    Text('Ori and The Blind Forest')
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
                    Image.asset("assets/images/metroid1.jpg"),
                    Divider(),
                    Text('Metroid Other M')
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
                    Image.asset("assets/images/HK1.jpg"),
                    Divider(),
                    Text('Hollow Knight')
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
                    Image.asset("assets/images/mario1.jpg"),
                    Divider(),
                    Text('Super Mario World')
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
     );
     
  } 
        }