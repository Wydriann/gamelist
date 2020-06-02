import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gamelist/app/models/base_model.dart';


class Plataforms extends BaseModel {
  static const String COLLECTION_NAME = 'Plataforms';
  static const String NOME = "nome";
  String _documentId;
  String nome;


  Plataforms();


  @override
  String documentId() {
    return this._documentId;
  }

  @override
  Plataforms.fromMap(DocumentSnapshot document) {
    this._documentId = document.documentID.toString();

    this.nome = document.data[Plataforms.NOME];

  }

  @override
  toMap() {
    var map = new Map<String, dynamic>();
    map['nome'] = this.nome;
  return map;

  }

}