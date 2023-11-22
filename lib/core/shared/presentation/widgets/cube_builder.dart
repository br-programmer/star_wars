import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:star_wars/core/shared/shared.dart';

class CubeBuilder extends ConsumerWidget {
  const CubeBuilder({
    Key? key,
    this.size = 60,
  }) : super(key: key);
  final double size;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(gyroscopeProvider).maybeMap(
          orElse: SizedBox.shrink,
          gyroscopeAviable: (state) {
            var x = math.pi;
            var y = math.pi;
            final data = state.gyroscopeData;
            x = (x + -data.x * 1.5) % (math.pi * 2);
            y = (y + -data.y * 1.5) % (math.pi * 2);
            return Cube(x: x, y: y, size: size);
          },
          gyroscopeNotAviable: (_) => const Text(
            'Gyroscope not aviable',
          ),
        );
  }
}
