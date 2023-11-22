import 'package:flutter_riverpod/flutter_riverpod.dart';

enum SplashState { initial, loading, success }

final splashProvider = StateNotifierProvider<SplashProvider, SplashState>(
  (_) => SplashProvider(SplashState.initial)..init(),
);

class SplashProvider extends StateNotifier<SplashState> {
  SplashProvider(SplashState state) : super(state);

  Future<void> init() async {
    state = SplashState.loading;
    await Future<void>.delayed(const Duration(seconds: 3));
    state = SplashState.success;
  }
}
