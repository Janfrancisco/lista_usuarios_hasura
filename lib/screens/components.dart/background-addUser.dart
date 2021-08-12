import 'package:flutter/material.dart';

class BackgroundPageAddUser extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    Path path = Path();

    // path.lineTo(0, size.height / 2);
    // path.lineTo(size.width / 2, size.height / 2);
    path.quadraticBezierTo(size.width / 2, 0, size.width / 2, size.height / 2);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) {
    return true;
  }
}

class BackgroundAddUserPager extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);

    Paint gradientSide = Paint()
      ..style = PaintingStyle.fill
      ..shader = LinearGradient(
              colors: [Colors.amber[800], Colors.amber],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft)
          .createShader(Rect.fromCenter(
              center: center, height: size.height, width: size.width));
    Path path = Path();

    path.quadraticBezierTo(size.width / 2, 0, size.width / 2, size.height / 2);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, gradientSide);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
