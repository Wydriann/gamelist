import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:gamelist/app/models/plataforms_model.dart';
import 'package:rxdart/rxdart.dart';

import '../../app_module.dart';
import 'plataforms_repository.dart';

class PlataformsBloc extends BlocBase {

   var _repository = AppModule.to.getDependency<PlataformsRepository>();
  String _documentId;
  String _nome;

  PlataformsBloc() {
    _nomeController.listen((value) => _nome = value);
  
  }

  var _nomeController = BehaviorSubject<String>();
  Stream<String> get outNome => _nomeController.stream; 
  void setNome(String value) => _nomeController.sink.add(value);

  Observable<List<Plataforms>> get getPlataforms => _repository.getAll;

  void delete(String _documentId) => _repository.delete(_documentId);

  void setPlataforms(plataforms) {
    _documentId = plataforms.documentId();
    setNome(plataforms.nome);    
  }

  bool insertOrUpdate() {
    var _plataforms = Plataforms()..nome = _nome;

    if (_documentId?.isEmpty ?? true) {
      _repository.add(_plataforms);
    } else {
      _repository.update(_documentId, _plataforms);
    }

    return true;
  }
  
  @override
  void dispose() {
    super.dispose();
  }
}
