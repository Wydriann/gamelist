import 'package:flutter/material.dart';
import 'package:gamelist/app/utils/main_drawer.dart';
import 'package:gamelist/app/modules/genres/genre_edit_page.dart';

import '../../models/genre_model.dart';
import 'genres_bloc.dart';

class GenresPage extends StatefulWidget {
  final String title;

  static const String route = '/genres';

  const GenresPage({Key key, this.title = "Gêneros"}) : super(key: key);

  @override
  _GenresPageState createState() => _GenresPageState();
}

class _GenresPageState extends State<GenresPage> {
  var _bloc = GenresBloc();

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
          var _genres = Genre()..nome = "";

          Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => GenreEditPage(_genres))
            );
        },
        ),
      body: Container(
        child: StreamBuilder<List<Genre>>(
          stream: _bloc.getGenres,
          builder: (context, snapshot) {
            if(!snapshot.hasData) return CircularProgressIndicator();

            return Container(
              child: ListView(
                children: snapshot.data.map(
                  (_genres) {
                    return Dismissible(
                    key: Key(_genres.documentId()), 
                    onDismissed: (direction) {
                      _bloc.delete(_genres.documentId());
                    },
                    child: ListTile(
                      title: Text(_genres.nome),
                      trailing: Icon(Icons.arrow_right),
                      onTap: (){
                        Navigator.push(
                          context, 
                          MaterialPageRoute(
                            builder: (context) => GenreEditPage(_genres),
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
