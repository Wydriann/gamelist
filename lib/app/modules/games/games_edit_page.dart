import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gamelist/app/models/games_model..dart';
import 'package:gamelist/app/models/plataforms_model.dart';
import 'package:gamelist/app/modules/genres/genres_bloc.dart';
import 'package:gamelist/app/modules/plataform/plataforms_bloc.dart';
import 'package:intl/intl.dart';
import 'package:gamelist/app/models/genre_model.dart';

import 'games_bloc.dart';

class GamesEditPage extends StatefulWidget {
  final Games games;

  GamesEditPage(this.games);

  @override
  State<StatefulWidget> createState() => _GamesEditPageState();
}

class _GamesEditPageState extends State<GamesEditPage> {
  TextEditingController _nomeController;
  TextEditingController _playedHoursController;
  TextEditingController _plataformsController;

  final _bloc = GamesBloc();
  final _blocGenres = GenresBloc();
  final _blocPlataforms = PlataformsBloc();
  final _dateFormat = DateFormat("dd/MM/yyy");

  @override
  void initState() {
    _bloc.setGames(widget.games);
    _nomeController = TextEditingController(text: widget.games.nome);
    _playedHoursController = TextEditingController(text: widget.games.playedHours);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edição de Games"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: <Widget>[
              Container(
                child: TextField(
                  decoration: InputDecoration(labelText: "Nome do Game"),
                  controller: _nomeController,
                  onChanged: _bloc.setNome,
                ),
              ),
               Container(
                child: TextField(
                  decoration: InputDecoration(labelText: "Melhor Tempo"),
                  controller: _playedHoursController,
                  onChanged: _bloc.setPlayedHours,
                ),
              ),
              
              Container(
                height: 6,
              ),
              StreamBuilder<DateTime>(
                stream: _bloc.outData,
                initialData: DateTime.now(),
                builder: (context, snapshot) {
                   if (!snapshot.hasData) return CircularProgressIndicator();

                  return InkWell(
                    onTap: () => _inputData(context, snapshot.data),
                    child: InputDecorator(
                      decoration: InputDecoration(
                        labelText: "Data de Criação",
                      ),
                      child: Row(
                        children: <Widget>[
                          Text(_dateFormat.format(snapshot.data)),
                          Icon(Icons.arrow_drop_down),
                        ],
                      ),
                    ),
                  );
                },
              ),
              Container(
                child: InputDecorator( 
                  decoration: InputDecoration( 
                    labelText: "Gênero do Game",
                  ),
                  child: StreamBuilder<List<Genre>>(
                    stream: _blocGenres.getGenres,
                    builder: (context, snapshotGenres){
                      var _genresId = _bloc.outGenreIdValue == null ||
                        _bloc.outGenreIdValue == ""
                      ? snapshotGenres.data.first.documentId()
                      : _bloc.outGenreIdValue;

                      if (!snapshotGenres.hasData) return CircularProgressIndicator();

                      return DropdownButton<String>(
                        value: _genresId,
                        isExpanded: true,
                        items: 
                           snapshotGenres.data.map((Genre _genres){
                          return DropdownMenuItem<String>(
                            value: _genres.documentId(),
                            child: Text(_genres.nome ),
                          );
                        }).toList(),
                        onChanged: (String genresId){
                          setState(() {                            
                          _genresId = genresId;
                          _bloc.setGenreId(genresId);
                          });

                        },

                      );
                    },
                    ),
                ),
              ),


              Container(
                child: InputDecorator( 
                  decoration: InputDecoration( 
                    labelText: "Plataformas",
                  ),
                  child: StreamBuilder<List<Plataforms>>(
                    stream: _blocPlataforms.getPlataforms,
                    builder: (context, snapshotPlataforms){
                      var _plataforms = _bloc.outPlataformsValue == null ||
                      _bloc.outPlataformsValue == ""
                      ? snapshotPlataforms.data.first.documentId()
                      : _bloc.outPlataformsValue;

                      if (!snapshotPlataforms.hasData) return CircularProgressIndicator();

                      return DropdownButton<String>(
                        value: _plataforms,
                        isExpanded: true,
                        items: 
                           snapshotPlataforms.data.map((Plataforms _plataforms){
                          return DropdownMenuItem<String>(
                            value: _plataforms.documentId(),
                            child: Text(_plataforms.nome),
                          );
                        }).toList(),
                        onChanged: (String plataforms){
                          setState(() {                            
                          _plataforms = plataforms;
                          _bloc.setPlataforms(plataforms);
                          });

                        },

                      );
                    },
                    ),
                ),
              ),


              Container(height: 6),
              RaisedButton(
                child: Text("Salvar"),
                onPressed: () {
                  if (_bloc.insertOrUpdate()) {
                    Navigator.pop(context);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future _inputData(BuildContext context, DateTime initialDate) async {
    DateTime choosedDate = await showDatePicker (
    context: context,
    initialDate: initialDate,
    firstDate: DateTime(1900), 
    lastDate: DateTime(2113),);


    if (choosedDate != null) {
      _bloc.setData(choosedDate);
    }
  }
}
