import 'package:dio/dio.dart';
import 'package:slidy_structure/app/pages/pokedex/pokedex_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidy_structure/app/pages/pokedex/pokedex_page.dart';
import 'package:slidy_structure/app/shared/repositories/poke_repository.dart';

class PokedexModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => PokedexController(i.get<PokeRepository>())),
        Bind((i) => PokeRepository(i.get<Dio>())),
      ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter('/:index', child: (_, args) => PokedexPage(index: args.params['index'],)),
      ];

  static Inject get to => Inject<PokedexModule>.of();
}
