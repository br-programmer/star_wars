part of 'gyroscope_provider.dart';

@freezed
class GyroscopeState with _$GyroscopeState {
  const factory GyroscopeState.checking() = _Checking;
  const factory GyroscopeState.gyroscopeNotAviable() = _GyroscopeNotAviable;
  const factory GyroscopeState.gyroscopeAviable({
    required GyroscopeData gyroscopeData,
  }) = _GyroscopeAviable;
}
