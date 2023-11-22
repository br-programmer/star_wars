class Routes {
  const Routes._({
    required this.name,
    required this.path,
  });
  final String name;
  final String path;

  static Routes get splash => const Routes._(
        name: 'splash',
        path: '/splash',
      );

  static Routes get characters => const Routes._(
        name: 'characters',
        path: '/characters',
      );
}
