import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CuadradoAnimado(),
      ),
    );
  }
}

class CuadradoAnimado extends StatefulWidget {
  @override
  _CuadradoAnimadoState createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado> with SingleTickerProviderStateMixin {
  AnimationController animationCtrl;
  Animation<double> rotation;

  @override
  void initState() {
    animationCtrl = new AnimationController(vsync: this, duration: Duration(milliseconds: 4000));
    rotation = new Tween(begin: 0.0, end: 2.0 * Math.pi).animate(animationCtrl);

    animationCtrl.addListener(() {
      print('Status: ${animationCtrl.status}');
      if (animationCtrl.status == AnimationStatus.completed) {
        animationCtrl.reverse();
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    animationCtrl?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    animationCtrl.forward();

    return AnimatedBuilder(
      animation: animationCtrl,
//      child: ,
      builder: (BuildContext context, Widget child) {
        return Transform.rotate(
          angle: rotation.value,
          child: _Rectangulo(),
        );
      },
    );
  }
}

class _Rectangulo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
    );
  }
}
