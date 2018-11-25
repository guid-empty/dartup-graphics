// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SpinningSquare extends StatefulWidget {
  @override
  _SpinningSquareState createState() => _SpinningSquareState();
}

class SquarePainter extends CustomPainter {
  Color color;
  double width;

  SquarePainter({this.color, this.width});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    canvas.drawRect(Rect.fromLTWH(-width / 2, -width / 2, width, width), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class _SpinningSquareState extends State<SpinningSquare>
    with SingleTickerProviderStateMixin {
  AnimationController _animation;

  @override
  void initState() {
    super.initState();
    // We use 3600 milliseconds instead of 1800 milliseconds because 0.0 -> 1.0
    // represents an entire turn of the square whereas in the other examples
    // we used 0.0 -> math.pi, which is only half a turn.
    _animation = AnimationController(
      duration: const Duration(milliseconds: 3600),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animation,
      child:
        Center(
          child: CustomPaint(
            painter: SquarePainter(color: Colors.lightGreenAccent, width: 200.0),
          )
        )
    );

  }
}

void main() {
  runApp(Center(child: SpinningSquare()));
}