import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:star_wars/core/core.dart';

part 'gyroscope_provider.freezed.dart';
part 'gyroscope_state.dart';

final gyroscopeProvider =
    StateNotifierProvider<GyroscopeProvider, GyroscopeState>(
  (ref) => GyroscopeProvider(
    const GyroscopeState.checking(),
    nativeService: ref.read(Services.nativeService),
  )..init(),
);

class GyroscopeProvider extends StateNotifier<GyroscopeState> {
  GyroscopeProvider(
    GyroscopeState state, {
    required NativeService nativeService,
  })  : _nativeService = nativeService,
        super(state);

  final NativeService _nativeService;

  StreamSubscription<GyroscopeData>? _subscription;

  Future<void> init() async {
    final gyroscopeAviable = await _nativeService.gyroscopeAviable;
    state = gyroscopeAviable.when(
      left: (_) => const GyroscopeState.gyroscopeNotAviable(),
      right: (value) {
        if (value) {
          _subscription = _nativeService.onGyroscope.listen(_listen);
          return GyroscopeState.gyroscopeAviable(
            gyroscopeData: GyroscopeData.zero,
          );
        }
        return const GyroscopeState.gyroscopeNotAviable();
      },
    );
  }

  void _listen(GyroscopeData gyroscopeData) {
    state = GyroscopeState.gyroscopeAviable(gyroscopeData: gyroscopeData);
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
