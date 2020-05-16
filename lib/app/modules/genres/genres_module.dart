import 'package:gamelist/app/modules/genres/genres_repository.dart';
import 'package:gamelist/app/modules/genres/genres_bloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';

class GenresModule extends ModuleWidget {
  @override
  List<Bloc> get blocs => [
        Bloc((i) => GenresBloc()),
      ];

  @override
  List<Dependency> get dependencies => [
        Dependency((i) => GenresRepository()),
      ];

  @override
  Widget get view => Container();

  static Inject get to => Inject<GenresModule>.of();
}
