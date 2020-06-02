import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_pattern/bloc_pattern_test.dart';
import 'package:gamelist/app/modules/plataform/plataforms_bloc.dart';
import 'package:gamelist/app/modules/plataform/plataforms_module.dart';

void main() {
  initModule(PlataformsModule());
  PlataformsBloc bloc;

  // setUp(() {
  //     bloc = PlataformModule.to.bloc<PlataformBloc>();
  // });

  // group('PlataformBloc Test', () {
  //   test("First Test", () {
  //     expect(bloc, isInstanceOf<PlataformBloc>());
  //   });
  // });
}
