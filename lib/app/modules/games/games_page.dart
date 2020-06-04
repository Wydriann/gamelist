import 'package:flutter/material.dart';
import 'package:gamelist/app/models/games_model..dart';
import 'package:gamelist/app/utils/main_drawer.dart';
import 'package:intl/intl.dart';
import 'games_bloc.dart';
import 'package:gamelist/app/modules/games/games_edit_page.dart';

class GamesPage extends StatefulWidget {
  final String title;
  static const String route = '/Games';
  const GamesPage({Key key, this.title = "Games"}) : super(key: key);

  @override
  _GamesPageState createState() => _GamesPageState();
}

class _GamesPageState extends State<GamesPage> {
    var _bloc = GamesBloc();



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
          var _games = Games()
          ..nome = ""
          ..genreId = ""
          ..plataforms = ""
          ..playedHours = "" 
          ..data = DateTime.now();

          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => GamesEditPage(_games),
              ),
            );
        },
        ),
      body: Container(
        child: StreamBuilder<List<Games>>(
          stream: _bloc.getGames,
          builder: (context, snapshot) {
            if(!snapshot.hasData) return CircularProgressIndicator();

            return Container(
              child: ListView(
                children: snapshot.data.map(
                  (_games) {
                    return Dismissible(
                    key: Key(_games.documentId()), 
                    onDismissed: (direction) {
                      _bloc.delete(_games.documentId());
                    },
                    child: ListTile(
                      title: Text(_games.nome),
                      subtitle: Text(new DateFormat("dd-MM-yyyy")
                        .format(_games.data),),
                      trailing: Icon(Icons.arrow_right),
                      onTap: () {
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => GamesEditPage(_games),
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
