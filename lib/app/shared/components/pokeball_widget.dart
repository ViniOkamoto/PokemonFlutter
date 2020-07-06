import 'package:flutter/material.dart';

class PokeProgress extends StatefulWidget {
  final double width;
  final double height;
  PokeProgress({this.width, this.height});
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
          height: this.widget.height,
          width: this.widget.width,
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

class PokeBackground extends StatefulWidget {
  final double height;
  final double width;
  final double opacity;
  PokeBackground({this.height, this.width,this.opacity});
  @override
  _PokeBackgroundState createState() => new _PokeBackgroundState();
}

class _PokeBackgroundState extends State<PokeBackground>
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
    return AnimatedBuilder(
        animation: animationController,
        child: Container(
          height: widget.height,
          width: widget.width,
          child: Opacity(
            child: Image.asset('assets/images/background_logo.PNG', fit: BoxFit.cover,),
            opacity: widget.opacity,
          )
        ),
        builder: (BuildContext context, Widget _widget) {
          return new Transform.rotate(
            angle: animationController.value * 12.6,
            child: _widget,
          );
        },
      );
  }
  @override
  dispose() {
    animationController.dispose(); // you need this
    super.dispose();
  }
}