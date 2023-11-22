import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:star_wars/core/core.dart';

class Providers {
  const Providers._();

  static final http = Provider<Http>(
    (_) => Http(
      dio: Dio(BaseOptions(baseUrl: DartDefine.baseUrl)),
      enableLogging: DartDefine.enableLogging,
    ),
  );
}
