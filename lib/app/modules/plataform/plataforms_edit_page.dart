import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gamelist/app/models/plataforms_model.dart';

import 'plataforms_bloc.dart';

class PlataformsEditPage extends StatefulWidget {
  final Plataforms plataforms;

  PlataformsEditPage(this.plataforms);


  @override
  State<StatefulWidget> createState() => _PlataformsEditPageState();
  
}

class _PlataformsEditPageState extends State<PlataformsEditPage> {
  TextEditingController _nomeController;
  final _bloc = PlataformsBloc();

  @override
  void initState() {
    _bloc.setPlataforms(widget.plataforms);

    _nomeController = TextEditingController(text: widget.plataforms.nome);

    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edição das Plataformas"),
      ),
      body: Container( 
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: <Widget>[
              Container(
                child: TextField(
                  decoration: InputDecoration(labelText: "Ex: Console"),
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