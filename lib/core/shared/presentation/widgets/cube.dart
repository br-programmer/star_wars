import 'dart:math';

import 'package:flutter/material.dart';
import 'package:star_wars/core/core.dart';

class Cube extends StatefulWidget {
  const Cube({
    Key? key,
    required this.x,
    required this.y,
    required this.size,
    this.rainbow = false,
  }) : super(key: key);

  final double x;
  final double y;
  final double size;
  final bool rainbow;

  @override
  State<Cube> createState() => _CubeState();
}

class _CubeState extends State<Cube> {
  final double halfAPi = pi / 2;
  final double oneHalfAPi = pi + pi / 2;
  double get sum {
    return (widget.y + (widget.x > pi ? pi : 0)).abs() % (pi * 2);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Side(
          zRot: widget.y,
          xRot: -widget.x,
          moveZ: widget.x < halfAPi,
          size: widget.size,
          yRot: 0,
        ),
        Side(
          yRot: widget.y,
          xRot: halfAPi - widget.x,
          moveZ: sum < halfAPi,
          size: widget.size,
          zRot: 0,
        ),
        Side(
          yRot: -halfAPi + widget.y,
          xRot: halfAPi - widget.x,
          moveZ: sum < pi,
          size: widget.size,
          zRot: 0,
        ),
      ],
    );
  }
}
