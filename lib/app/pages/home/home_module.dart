import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidy_structure/app/pages/home/home_controller.dart';
import 'package:slidy_structure/app/pages/home/home_page.dart';
import 'package:slidy_structure/app/pages/pokedex/pokedex_page.dart';
import 'package:slidy_structure/app/shared/repositories/poke_repository.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i.get<PokeRepository>())),
        Bind((i) => PokeRepository(i.get<Dio>())),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter("/", child: (_, args) => HomePage()),
        ModularRouter('/pokedex', child: (_, args) => PokedexPage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
