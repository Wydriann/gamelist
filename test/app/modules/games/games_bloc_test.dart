import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';

import 'package:gamelist/app/modules/games/games_bloc.dart';
import 'package:gamelist/app/modules/games/games_module.dart';

void main() {
  initModule(GamesModule());
  GamesBloc bloc;

  // setUp(() {
  //     bloc = GamesModule.to.bloc<GamesBloc>();
  // });

  // group('GamesBloc Test', () {
  //   test("First Test", () {
  //     expect(bloc, isInstanceOf<GamesBloc>());
  //   });
  // });
}
