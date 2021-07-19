import 'package:flutter/material.dart';

import 'paint_popover/popover_paint.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SafeArea(
        child: Scaffold(
          body: Center(
            child: PopoverPaint(),
          ),
        ),
      ),
    );
  }
}
