import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:rxdart/rxdart.dart';

import '../../app_module.dart';
import '../../models/genre_model.dart';
import 'genres_repository.dart';

class GenresBloc extends BlocBase {
  var _repository = AppModule.to.getDependency<GenresRepository>();



  Observable<List<Genre>> get getGenres => _repository.getAll;


  GenresBloc() {}

  //dispose will be called automatically by closing its streams
  @override
  void dispose() {
    super.dispose();
  }
}
