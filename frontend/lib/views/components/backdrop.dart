import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class BackDrop extends CustomPainter{
  
  @override
  void paint(Canvas canvas, Size size) {

  Paint paint_0 = new Paint()
      ..shader = ui.Gradient.linear(
        Offset(size.width, 0),
        Offset(0, size.height),
        [
          Colors.blue[900],
          Colors.white
        ]
      )
      // ..color = Color.fromARGB(255, 33, 150, 243)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;
     
         
    Path path_0 = Path();
    path_0.moveTo(0,size.height*0.86);
    path_0.quadraticBezierTo(size.width*0.19,size.height*0.24,size.width*0.42,size.height*0.50);
    path_0.quadraticBezierTo(size.width*0.65,size.height*0.76,size.width,0);
    path_0.lineTo(0,0);

    canvas.drawPath(path_0, paint_0);
  
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}
