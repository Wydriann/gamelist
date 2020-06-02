import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:gamelist/app/models/games_model..dart';
import 'package:gamelist/app/modules/games/games_repository.dart';
import 'package:rxdart/rxdart.dart';

import '../../app_module.dart';

class GamesBloc extends BlocBase {
  var _repository = AppModule.to.getDependency<GamesRepository>();
  String _documentId;
  String _nome, _genreId, _plataform, _playedHours;
  DateTime _data; 



  GamesBloc() {
    _nomeController.listen((value) => _nome = value);
    _genreIdController.listen((value) => _genreId = value);
    _plataformsController.listen((value) => _plataform = value);
    _playedHoursController.listen((value) => _playedHours = value);
    _dataController.listen((value) => _data = value);
  
  }

  var _nomeController = BehaviorSubject<String>();
  Stream<String> get outNome => _nomeController.stream; 
  void setNome(String value) => _nomeController.sink.add(value);

  // genreId
  var _genreIdController = BehaviorSubject<String>();
  Stream<String> get outGenreId => _genreIdController.stream; 
  String get outGenreIdValue => _genreIdController.stream.value; 
  void setGenreId(String value) => _genreIdController.sink.add(value);

  // plataform 
  var _plataformsController = BehaviorSubject<String>();
  Stream<String> get outPlataforms => _plataformsController.stream; 
  String get outPlataformsValue => _plataformsController.stream.value;
  void setPlataforms(String value) => _plataformsController.sink.add(value);

  // playedHours 
  var _playedHoursController = BehaviorSubject<String>();
  Stream<String> get outplayedHours => _playedHoursController.stream; 
  void setPlayedHours(String value) => _playedHoursController.sink.add(value);

  // data
  var _dataController = BehaviorSubject<DateTime>();
  Stream<DateTime> get outData => _dataController.stream; 
  void setData(DateTime value) => _dataController.sink.add(value);

  Observable<List<Games>> get getGames => _repository.getAll;

  void delete(String _documentId) => _repository.delete(_documentId);

  void setGames(Games games) {
    _documentId = games.documentId();
    setNome(games.nome);    
    setGenreId(games.genreId);  
    setPlataforms(games.plataform);  
    setPlayedHours(games.playedHours);  
    setData(games.data);  
  }

  bool insertOrUpdate() {
    var _games = Games()
    ..nome = _nome
    ..genreId = _genreId
    ..plataform = _plataform
    ..playedHours = _playedHours
    ..data = _data;

    if (_documentId?.isEmpty ?? true) {
      _repository.add(_games);
    } else {
      _repository.update(_documentId, _games);
    }

    return true;
  }

  @override
  void dispose() {
    super.dispose();
  }
}
