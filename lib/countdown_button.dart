import 'dart:async';

import 'package:flutter/material.dart';

class CountdownButton extends StatefulWidget {
  final String initialText;
  final VoidCallback onCompleted;

  const CountdownButton({
    Key key,
    @required this.initialText,
    @required this.onCompleted,
  }) : super(key: key);

  @override
  _CountdownButtonState createState() => _CountdownButtonState();
}

class _CountdownButtonState extends State<CountdownButton>
    with TickerProviderStateMixin {
  AnimationController _animationController;
  String _label;

  @override
  void initState() {
    super.initState();

    setState(() {
      _label = widget.initialText;
    });

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );

    // double _threshold =
    //     num.parse((1 / widget.countdownDuration).toStringAsFixed(1));

    _animationController.addListener(() {
      setState(() {
        if (_animationController.value <= 0.333333) {
          _label = '3';
        } else if (_animationController.value <= 0.66666) {
          _label = '2';
        } else if (_animationController.value <= 0.99999) {
          _label = '1';
        }

        // _label =
        //     num.parse(_animationController.value.toStringAsFixed(1)).toString();
      });

      if (_animationController.value == 1) {
        widget.onCompleted();
        _animationController.reset();
        setState(() {
          _label = widget.initialText;
        });
      }
    });
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        _animationController.forward();
      },
      onLongPressUp: () {
        _animationController.stop();
        _animationController.reset();
        setState(() {
          _label = widget.initialText;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.redAccent,
          shape: BoxShape.circle,
        ),
        child: Text(_label),
      ),
    );
  }
}
