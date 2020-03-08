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
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            left: 50,
            top: 150,
            child: Image.asset("assets/images/pokedex_logo.png"),
          ),
          Positioned(
            bottom: 175,
            left: 125,
            width: 150,
            child: Image.asset("assets/images/5FBP.gif"),
          )
        ],
        //        child: RotationTransition(
//            turns: Tween(begin: 0.0, end: 1.0).animate(animationController),
//
//        ),
      ),
    );
  }
}
