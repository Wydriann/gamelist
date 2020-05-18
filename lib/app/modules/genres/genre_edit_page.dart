import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gamelist/app/models/genre_model.dart';
import 'package:gamelist/app/modules/genres/genres_bloc.dart';

class GenreEditPage extends StatefulWidget {
  final Genre genres;

  GenreEditPage(this.genres);


  @override
  State<StatefulWidget> createState() => _GenreEditPageState();
  
}

class _GenreEditPageState extends State<GenreEditPage> {
  TextEditingController _nomeController;
  final _bloc = GenresBloc();

  @override
  void initState() {
    _bloc.setGenres(widget.genres);

    _nomeController = TextEditingController(text: widget.genres.nome);

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edição do Gênero"),
      ),
      body: Container( 
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: <Widget>[
              Container(
                child: TextField(
                  decoration: InputDecoration(labelText: "Ex: First Person Shooter (FPS)"),
                  controller: _nomeController,
                  onChanged: _bloc.setNome,
                ),
              ),
              RaisedButton(child: Text("Salvar") ,
              onPressed: () {
                if (_bloc.insertOrUpdate()) {
                  Navigator.pop(context);
                }
              },
              ),
            ],
           ) ,
        ),
      ),
    );
  }
}