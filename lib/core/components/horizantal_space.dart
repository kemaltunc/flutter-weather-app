import 'package:flutter/material.dart';

class HorizantalSpace extends StatelessWidget {
  final double width;

  const HorizantalSpace(this.width) : super();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}
