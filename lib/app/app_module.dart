import 'package:slidy_structure/app/pages/splash/splash_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidy_structure/app/app_controller.dart';
import 'package:slidy_structure/app/app_widget.dart';
import 'package:slidy_structure/app/pages/home/home_module.dart';
import 'package:slidy_structure/app/pages/splash/splash_page.dart';
import 'package:slidy_structure/app/shared/utils/constants.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => SplashController()),
        Bind((i) => Dio(BaseOptions(baseUrl: URL_BASE))),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => SplashPage()),
        Router('/home', module: HomeModule()),
//        Router('/other/:text',
//            child: (_,args) => OtherPage(
//              text: args.params['text'],
//        )),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
