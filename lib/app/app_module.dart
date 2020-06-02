import 'package:gamelist/app/modules/logon/logon_bloc.dart';
import 'package:gamelist/app/app_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:gamelist/app/app_widget.dart';

import 'modules/games/games_repository.dart';
import 'modules/genres/genres_repository.dart';
import 'modules/plataform/plataforms_repository.dart';

class AppModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => LogonBloc()),
        Bloc((i) => AppBloc()),
      ];

  @override
  List<Dependency> get dependencies => [
    Dependency((i) => GenresRepository()),
    Dependency((i) => GamesRepository()),
    Dependency((i) => PlataformsRepository()),
  ];

  @override
  Widget get view => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
