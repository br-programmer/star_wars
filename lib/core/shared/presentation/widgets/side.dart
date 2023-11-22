import 'package:flutter/material.dart';
import 'package:star_wars_ui/star_wars_ui.dart';

class Side extends StatelessWidget {
  const Side({
    Key? key,
    required this.moveZ,
    required this.xRot,
    required this.yRot,
    required this.zRot,
    required this.size,
  }) : super(key: key);
  final bool moveZ;
  final double xRot;
  final double yRot;
  final double zRot;
  final double size;

  @override
  Widget build(BuildContext context) {
    final radius = size / 2;
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..rotateX(xRot)
        ..rotateY(yRot)
        ..rotateZ(zRot)
        ..translate(0.0, 0, moveZ ? -radius : radius),
      child: SizedBox.square(
        dimension: size,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Palette.primary,
            border: Border.all(width: 0.8, color: Colors.black26),
          ),
          child: const Padding(
            padding: edgeInsets6,
            child: FlutterLogo(),
          ),
        ),
      ),
    );
  }
}
