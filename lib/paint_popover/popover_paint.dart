import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PopoverPaint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: PopoverPainter(),
      // size: Size(200, 300),
    );
  }
}

class PopoverPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    final Path path = Path();

    final double width = size.width; // chiều rộng của lá cờ
    final double height = 2 * width / 3; // chiều cao của lá cờ bằng 2 / 3 chiều rộng

    final arrowRect = Rect.fromLTRB(0, 0, 60, 100); // arrow
    final bodyRect = Rect.fromLTRB(0, 100, 60, 200); // body
    final radius = 8.0;

    path.moveTo(arrowRect.left, arrowRect.bottom); // đưa ngòi bút đến điểm A
    path.lineTo(arrowRect.left + arrowRect.width / 2, arrowRect.top); //
    path.lineTo(arrowRect.right, arrowRect.bottom);

    path.lineTo(bodyRect.right - radius, bodyRect.top);
    path.conicTo(
      bodyRect.right,
      bodyRect.top,
      bodyRect.right,
      bodyRect.top + radius,
      1,
    );

    path.lineTo(bodyRect.right, bodyRect.bottom - radius);
    path.conicTo(
      bodyRect.right,
      bodyRect.bottom,
      bodyRect.right - radius,
      bodyRect.bottom,
      1,
    );

    path.lineTo(bodyRect.left + radius, bodyRect.bottom);
    path.conicTo(
      bodyRect.left,
      bodyRect.bottom,
      bodyRect.left,
      bodyRect.bottom - radius,
      1,
    );

    path.lineTo(bodyRect.left, bodyRect.top + radius);
    path.conicTo(
      bodyRect.left,
      bodyRect.top,
      bodyRect.left + radius,
      bodyRect.top,
      1,
    );

    final Paint yellowPaint = Paint() // tạo paint màu vàng để vẽ sao vàng
      ..color = Colors.yellow
      ..style = PaintingStyle.fill;

    // vẽ lại realPath
    canvas.drawPath(path, yellowPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
