import 'package:flutter/material.dart';

class SlideTransitionStartUp extends StatefulWidget {
  final Widget child;
  final Duration? duration;
  const SlideTransitionStartUp({Key? key, required this.child, this.duration})
      : super(key: key);

  @override
  _SlideTransitionStartUpState createState() => _SlideTransitionStartUpState();
}

class _SlideTransitionStartUpState extends State<SlideTransitionStartUp>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Offset> animation;
  @override
  void initState() {
    controller = AnimationController(
        vsync: this,
        duration:
            widget.duration == null ? Duration(seconds: 1) : widget.duration);
    animation =
        Tween(begin: Offset(1, 0), end: Offset(0, 0)).animate(controller);
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
    return SlideTransition(position: animation, child: widget.child);
  }
}
