import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:star_wars_ui/star_wars_ui.dart';

class StarWarsBaseShimmer extends StatelessWidget {
  const StarWarsBaseShimmer({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Palette.grey,
      highlightColor: Palette.whiteLight,
      child: child,
    );
  }
}
