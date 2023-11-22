class GyroscopeData {
  GyroscopeData({
    required this.x,
    required this.y,
    required this.z,
  });

  final double x;
  final double y;
  final double z;

  static GyroscopeData get zero => GyroscopeData(x: 0, y: 0, z: 0);
}
