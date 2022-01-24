import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animations_themes_custom_painter/widgets/custom_button.dart';
import 'package:flutter_animations_themes_custom_painter/widgets/custom_text.dart';

class ImplicitAnimationsExample extends StatefulWidget {
  const ImplicitAnimationsExample({Key? key}) : super(key: key);

  @override
  _ImplicitAnimationsExampleState createState() => _ImplicitAnimationsExampleState();
}

class _ImplicitAnimationsExampleState extends State<ImplicitAnimationsExample> {
  var _width = 120.0;
  var _height = 140.0;
  var _opacity = 0.0;
  var _angle = 0.0;
  var _animationDuration = Duration(milliseconds: 400);
  late Color _color;
  late double _borderRadius;
  late double _margin;

  @override
  void initState() {
    super.initState();
    _color = _randomColor();
    _borderRadius = _randomValue();
    _margin = _randomValue();

    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        _opacity = 1;
      });
    });
  }

  double _randomValue({int max = 80}) {
    return Random().nextDouble() * max;
  }

  Color _randomColor() {
    return Color(0XFFFFFFFF & Random().nextInt(0xFFFFFFFF));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('implicit Animations', style: TextStyle(color: Colors.black)),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedOpacity(
              duration: _animationDuration,
              opacity: _opacity,
              child: AnimatedContainer(
                duration: _animationDuration,
                width: _width,
                height: _height,
                alignment: Alignment.center,
                margin: EdgeInsets.all(_margin),
                decoration: BoxDecoration(
                  color: _color,
                  borderRadius: BorderRadius.circular(_borderRadius),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              onTap: () {
                setState(() {
                  _color = _randomColor();
                  _borderRadius = _randomValue();
                  _margin = _randomValue();
                });
              },
              label: ' Change look 👀',
            ),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              onTap: () {
                setState(() {
                  _height = _randomValue(max: 200);
                  _width = _randomValue(max: 300);
                });
              },
              label: ' Change Size 🤏🏻',
            ),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              onTap: () {},
              label: ' Rotate 🔁',
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}