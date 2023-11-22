import 'dart:async';

import 'package:flutter/services.dart';
import 'package:star_wars/core/core.dart';

class NativeService {
  static const _gyroscopePlatformChannel = MethodChannel(
    'dev.brprogrammer.star_wars/gyroscope',
  );

  static const _gyroscopeEventChannel = EventChannel(
    'dev.brprogrammer.star_wars/gyroscope-listener',
  );

  FutureEither<Exception, bool> get gyroscopeAviable async {
    try {
      final exist = await _gyroscopePlatformChannel.invokeMethod<bool>('check');
      return Either.right(exist ?? false);
    } catch (_) {
      return Either.left(Exception(_));
    }
  }

  Stream<GyroscopeData> get onGyroscope {
    return _gyroscopeEventChannel.receiveBroadcastStream().map(_map);
  }

  GyroscopeData _map(dynamic data) {
    final map = data as Map<Object?, Object?>;
    return GyroscopeData(
      x: map['x']! as double,
      y: map['y']! as double,
      z: map['z']! as double,
    );
  }
}
