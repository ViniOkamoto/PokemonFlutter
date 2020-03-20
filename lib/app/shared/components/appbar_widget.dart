import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidy_structure/app/shared/components/paint_widget.dart';

class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const MyCustomAppBar({
    Key key,
    @required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Stack(
              fit: StackFit.passthrough,
              children: <Widget>[
                TopBar(),
                Positioned(
                  left: 20,
                  top: 15,
                  child: GestureDetector(
                    onTap: (){
                      Modular.to.pushReplacementNamed('/home');
                    },
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.white,
                              width: 5
                          ),
                          shape: BoxShape.circle,
                          color: Color(0xff6893CB)
                      ),
                    ),
                  ),
                ),

                Positioned(
                  left: 100,
                  top: 15,
                  child: Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff661D1D),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xffEA9C00),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Container(
                          width: 20,
                          height: 20,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff799A49),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    width: 150,
                    height: 50,
                    child: Image.asset("assets/images/pokedex_logo.png"),
                  ),
                )
              ],
            ),
          )

        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}


class CircleButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final Widget widget;
  final double size;
  final Color color;

  const CircleButton({Key key, this.onTap, this.widget, this.size, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return new InkResponse(
      onTap: onTap,
      child: new Container(
        width: size,
        height: size,
        decoration: new BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
        child: widget
        ),
    );
  }
}