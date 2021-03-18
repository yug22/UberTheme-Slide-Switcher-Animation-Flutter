import 'package:flutter/material.dart';

class SlideTransitionAnimation extends StatefulWidget {
  Widget state;
  SlideTransitionAnimation({this.state});
  @override
  _SlideTransitionAnimationState createState() =>
      _SlideTransitionAnimationState();
}

class _SlideTransitionAnimationState extends State<SlideTransitionAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _offsetFloat;

  _slideTransitionAnimation() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    /// ==== left to right -3.0 and right to left 3.0 ==== ///

    _offsetFloat = Tween<Offset>(
      begin: Offset(3.0, 0.0),
      end: Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.ease,
      ),
    );
    _controller.forward();
  }

  @override
  void initState() {
    super.initState();
    _slideTransitionAnimation();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetFloat,
      child: widget.state,
    );
  }
}
