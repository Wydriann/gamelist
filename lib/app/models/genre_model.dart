import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gamelist/app/models/base_model.dart';


class Genre extends BaseModel {
  static const String COLLECTION_NAME = 'Genres';
  static const String NOME = "nome";
  String _documentId;
  String nome;


  Genre();


  @override
  String documentId() {
    return this._documentId;
  }

  @override
  Genre.fromMap(DocumentSnapshot document) {
    this._documentId = document.documentID.toString();

    this.nome = document.data[Genre.NOME];

  }

  @override
  toMap() {
    var map = new Map<String, dynamic>();
    map['nome'] = this.nome;
  return map;

  }

}