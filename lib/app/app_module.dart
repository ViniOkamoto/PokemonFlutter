import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidy_structure/app/pages/home/home_module.dart';
import 'package:dio/dio.dart';
import 'package:slidy_structure/app/app_widget.dart';
import 'package:slidy_structure/app/pages/pokedex/pokedex_module.dart';
import 'package:slidy_structure/app/pages/splash/splash_page.dart';
import 'package:slidy_structure/app/shared/utils/constants.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio(BaseOptions(baseUrl: URL_BASE))),
      ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter('/', child: (_, args) => SplashPage()),
    ModularRouter('/home', module: HomeModule()),//
    ModularRouter('/pokedex', module: PokedexModule()),//  Router('/other/:text',
//            child: (_,args) => OtherPage(
//              text: args.params['text'],
//        )),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
