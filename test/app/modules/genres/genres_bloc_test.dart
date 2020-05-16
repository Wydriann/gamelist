import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:gamelist/app/modules/genres/genres_bloc.dart';
import 'package:gamelist/app/modules/genres/genres_module.dart';

void main() {
  initModule(GenresModule());
  GenresBloc bloc;

  // setUp(() {
  //     bloc = GenresModule.to.bloc<GenresBloc>();
  // });

  // group('GenresBloc Test', () {
  //   test("First Test", () {
  //     expect(bloc, isInstanceOf<GenresBloc>());
  //   });
  // });
}
