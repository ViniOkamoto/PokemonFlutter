import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: Container(
        height: 100,
      ),
      painter: CurvePainter(),
    );
  }
}

class CurvePainter extends CustomPainter{
  Color colorOne = Color(0xffCC3D3B);
  Color colorTwo = Color(0xff902927);

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Paint paint = Paint();


    path.lineTo(0.0, size.height);//posição de x= 0  e y = o valor máximo
    path.lineTo(size.width*0.56, size.height );//posição de x= tela/3 valor máximo e y = tamanho*0,4
    path.lineTo(size.width*0.69, size.height*0.56 );//posição de x= tela*0,6 valor máximo e y = 0.25
    path.lineTo(size.width, size.height*0.56 );//posição de x= 0 valor máximo e y = tela*0.25
    path.lineTo(size.width, 0 ); //posição de x= 0 valor máximo e y = 0
    path.close();

    paint.color = colorTwo;
    canvas.drawPath(path, paint);

    path = Path();
    path.lineTo(0.0, size.height*0.93);//posição de x= 0  e y = o valor máximo
    path.lineTo(size.width*0.55, size.height*0.93 );//posição de x= tela/3 valor máximo e y = tamanho*0,4
    path.lineTo(size.width*0.68, size.height*0.5 );//posição de x= tela*0,6 valor máximo e y = 0.25
    path.lineTo(size.width, size.height*0.5 );//posição de x= 0 valor máximo e y = tela*0.25
    path.lineTo(size.width, 0 ); //posição de x= 0 valor máximo e y = 0
    path.close();

    paint.color = colorOne;
    canvas.drawPath(path, paint);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }

}