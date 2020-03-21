import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {

  AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

//    animationController = AnimationController(duration: const Duration(milliseconds: 500), vsync: this);
    Future.delayed(Duration(seconds: 4)).then((v){
      Modular.to.pushReplacementNamed('/home');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/splash.gif"),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(

              child: Align(
                alignment: Alignment.topCenter,
                child: Image.asset("assets/images/PokemonSlidy.png"),
              ),
            )
      ),
    );
  }
}
