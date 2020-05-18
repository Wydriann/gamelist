import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:gamelist/app/models/genre_model.dart';
import 'package:rxdart/rxdart.dart';

class GenresRepository extends Disposable {
  CollectionReference _collection =
   Firestore.instance.collection(Genre.COLLECTION_NAME);

   void add(Genre _genre) => _collection.add(_genre.toMap()); 

   void update(String _documentId, Genre _genres) =>
      _collection.document(_documentId).updateData(_genres.toMap());

   void delete(String _documentId) => _collection.document(_documentId).delete();

  Observable<List<Genre>> get getAll =>
  Observable(_collection.snapshots().map((query) =>
  query.documents.map<Genre>((document)
  => Genre.fromMap(document)).toList()));
  
Future<Genre> getById(String _documentId) async {
  DocumentSnapshot genre = await _collection.document(_documentId).get();

  return Genre.fromMap(genre);
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
