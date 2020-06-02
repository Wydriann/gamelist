import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:gamelist/app/models/plataforms_model.dart';
import 'package:rxdart/rxdart.dart';

class PlataformsRepository extends Disposable {
   CollectionReference _collection =
   Firestore.instance.collection(Plataforms.COLLECTION_NAME);

   void add(Plataforms _plataforms) => _collection.add(_plataforms.toMap()); 

   void update(String _documentId, Plataforms _plataforms) =>
      _collection.document(_documentId).updateData(_plataforms.toMap());

   void delete(String _documentId) => _collection.document(_documentId).delete();

  Observable<List<Plataforms>> get getAll =>
  Observable(_collection.snapshots().map((query) =>
  query.documents.map<Plataforms>((document)
  => Plataforms.fromMap(document)).toList()));
  
Future<Plataforms> getById(String _documentId) async {
  DocumentSnapshot plataforms = await _collection.document(_documentId).get();

  return Plataforms.fromMap(plataforms);
}



  Future fetchPost(Dio client) async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
}
