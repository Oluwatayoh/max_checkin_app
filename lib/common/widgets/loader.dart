import 'package:flutter/material.dart';

class Loader extends StatefulWidget {
  @override
  _Loader createState() => _Loader();
}

class _Loader extends State<Loader> with SingleTickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1500));
    _animationController!.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      extendBody: true,
      body: Center(
        child: RotationTransition(
          turns: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
              parent: _animationController!, curve: Curves.easeInOut)),
          child: Image.asset('assets/logo.jpeg', width: 100, height: 100),
        ),
        // child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  void dispose() {
    _animationController!.dispose();
    super.dispose();
  }
}
