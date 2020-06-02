import 'package:gamelist/app/modules/plataform/plataforms_repository.dart';
import 'package:gamelist/app/modules/plataform/plataforms_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class PlataformsModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => PlataformsBloc()),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => PlataformsRepository()),
      ];

  @override
  Widget get view => Container();

  static Inject get to => Inject<PlataformsModule>.of();
}
