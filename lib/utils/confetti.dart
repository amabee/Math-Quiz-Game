import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class MyConfetti extends StatefulWidget {
  const MyConfetti({required Key key}) : super(key: key);

  @override
  _MyConfettiState createState() => _MyConfettiState();
}

class _MyConfettiState extends State<MyConfetti> {
  late ConfettiController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ConfettiController(
      duration: Duration(seconds: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ConfettiWidget(
      confettiController: _controller,
    );
  }

  void startConfetti() {
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
