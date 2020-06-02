import 'package:flutter/material.dart';
import 'package:gamelist/app/models/plataforms_model.dart';
import 'package:gamelist/app/utils/main_drawer.dart';

import 'plataforms_bloc.dart';
import 'plataforms_edit_page.dart';

class PlataformsPage extends StatefulWidget {
  final String title;
  static const String route = '/plataforms';
  
  const PlataformsPage({Key key, this.title = "Plataformas"}) : super(key: key);

  @override
  _PlataformsPageState createState() => _PlataformsPageState();
}

class _PlataformsPageState extends State<PlataformsPage> {
  var _bloc = PlataformsBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          var _plataforms = Plataforms()..nome = "";

          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => PlataformsEditPage(_plataforms),),
            );
        },
        ),
      body: Container(
        child: StreamBuilder<List<Plataforms>>(
          stream: _bloc.getPlataforms,
          builder: (context, snapshot) {
            if(!snapshot.hasData) return CircularProgressIndicator();

            return Container(
              child: ListView(
                children: snapshot.data.map(
                  (_plataforms) {
                    return Dismissible(
                    key: Key(_plataforms.documentId()), 
                    onDismissed: (direction) {
                      _bloc.delete(_plataforms.documentId());
                    },
                    child: ListTile(
                      title: Text(_plataforms.nome),
                      trailing: Icon(Icons.arrow_right),
                      onTap: (){
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                           builder: (context) => PlataformsEditPage(_plataforms),
                          ),
                        );
                      },),
                   );
                },
                ).toList(),
              ),
            );
          },
          ),
      ),
    );
  }
}
