import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShadowRadiusBox extends StatelessWidget {
  final Widget child;
  final Color color;

  const ShadowRadiusBox({Key key, this.child, this.color = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(padding: const EdgeInsets.all(8.0), child: child),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(2)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ]),
    );
  }
}
