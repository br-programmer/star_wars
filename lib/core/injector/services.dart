import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:star_wars/core/core.dart';

class Services {
  const Services._();
  static final nativeService = Provider((_) => NativeService());
}
