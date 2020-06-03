import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gamelist/app/models/base_model.dart';

class Games extends BaseModel {
  static const String COLLECTION_NAME = 'Games';
  static const String NOME = "nome",
      DATA = "data",
      GENRE_ID = "genreId",
      PLATAFORMS = "plataforms",
      PLAYED_HOURS = "playedHours";
  String _documentId;
  String nome, genreId, plataforms, playedHours;
  DateTime data;

  Games();

  @override
  String documentId() {
    return this._documentId;
  }

  @override
  Games.fromMap(DocumentSnapshot document) {
    this._documentId = document.documentID.toString();

    this.nome = document.data[Games.NOME];
    Timestamp ts = document.data[Games.DATA];
    this.data = DateTime.fromMillisecondsSinceEpoch(ts.millisecondsSinceEpoch);
    this.genreId = document.data[Games.GENRE_ID];
    this.plataforms = document.data[Games.PLATAFORMS];
    this.playedHours = document.data[Games.PLAYED_HOURS];
  }

  @override
  toMap() {
    var map = new Map<String, dynamic>();
    map[Games.NOME] = this.nome;
    map[Games.DATA] = this.data;
    map[Games.GENRE_ID] = this.genreId;
    map[Games.PLATAFORMS] = this.plataforms;
    map[Games.PLAYED_HOURS] = this.playedHours;
    return map;
  }
}
