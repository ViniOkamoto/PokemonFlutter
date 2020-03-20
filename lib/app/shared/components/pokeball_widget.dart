import 'package:flutter/material.dart';

class PokeProgress extends StatefulWidget {
  @override
  _PokeProgressState createState() => new _PokeProgressState();
}

class _PokeProgressState extends State<PokeProgress>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      vsync: this,
      duration: new Duration(seconds: 10),
    );

    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      alignment: Alignment.center,
      child: new AnimatedBuilder(
        animation: animationController,
        child: new Container(
          height: 70.0,
          width: 70.0,
          child: new Image.asset('assets/images/Pokebola.png'),
        ),
        builder: (BuildContext context, Widget _widget) {
          return new Transform.rotate(
            angle: animationController.value * 50,
            child: _widget,
          );
        },
      ),
    );
  }
  @override
  dispose() {
    animationController.dispose(); // you need this
    super.dispose();
  }
}