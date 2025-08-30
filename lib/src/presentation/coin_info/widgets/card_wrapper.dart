import 'package:flutter/material.dart';

class CardWrapper extends StatefulWidget {
  const CardWrapper({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(4.0),
  });

  final Widget child;
  final EdgeInsets padding;

  @override
  State<CardWrapper> createState() => _CardWrapperState();
}

class _CardWrapperState extends State<CardWrapper> {


  double _opacity = 0;
  @override
  void initState() {
    _opacity = 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.padding,
      child: AnimatedOpacity(
        duration: Duration(seconds: 1),
        opacity: _opacity,
        
        child: Card(
          
          child: widget.child,
        ),
      ),
    );
  }
}