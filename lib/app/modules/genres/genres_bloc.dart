import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

import '../../app_module.dart';
import '../../models/genre_model.dart';
import 'genres_repository.dart';

class GenresBloc extends BlocBase {
  var _repository = AppModule.to.getDependency<GenresRepository>();
  String _documentId;
  String _nome;

  GenresBloc() {
    _nomeController.listen((value) => _nome = value);
  
  }

  var _nomeController = BehaviorSubject<String>();
  Stream<String> get outNome => _nomeController.stream; 
  void setNome(String value) => _nomeController.sink.add(value);

  Observable<List<Genre>> get getGenres => _repository.getAll;

  void delete(String _documentId) => _repository.delete(_documentId);

  void setGenres(genres) {
    _documentId = genres.documentId();
    setNome(genres.nome);    
  }

   @override
  void dispose() {
    super.dispose();
  }

  bool insertOrUpdate() {
    var _genres = Genre()..nome = _nome;

    if (_documentId?.isEmpty ?? true) {
      _repository.add(_genres);
    } else {
      _repository.update(_documentId, _genres);
    }

    return true;
  }
}
