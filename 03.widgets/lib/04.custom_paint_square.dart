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
  double innerWidth;

  SquarePainter({this.color, this.width, this.innerWidth});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    Paint black = new Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    canvas
      ..drawRect(Rect.fromLTWH(-width / 2, -width / 2, width, width), paint)
      ..drawRect(
          Rect.fromLTWH(
              -innerWidth / 2, -innerWidth / 2, innerWidth, innerWidth),
          black);
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
    _animation = AnimationController(
      value: 0.0,
      duration: const Duration(milliseconds: 3600),
      vsync: this,
      lowerBound: 0.0,
      upperBound: 1.0
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
        child: CustomPaint(
          painter: SquarePainter(
              color: Colors.lightGreenAccent, width: 200.0, innerWidth: 70.0),
        ));
  }
}

void main() {
  runApp(Center(child: SpinningSquare()));
}
