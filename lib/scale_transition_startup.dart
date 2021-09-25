import 'package:flutter/material.dart';

class ScaleTransitionStartUp extends StatefulWidget {
  final Widget child;
  final Duration? duration;
  const ScaleTransitionStartUp({Key? key, required this.child, this.duration})
      : super(key: key);

  @override
  _ScaleTransitionStartUpState createState() => _ScaleTransitionStartUpState();
}

class _ScaleTransitionStartUpState extends State<ScaleTransitionStartUp>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  @override
  void initState() {
    controller = AnimationController(
        vsync: this,
        duration:
            widget.duration == null ? widget.duration : Duration(seconds: 1));
    animation = Tween(begin: 0.0, end: 1.0).animate(controller);
    controller.forward();
    super.initState();
  }

  @override
  dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(scale: animation, child: widget.child);
  }
}
