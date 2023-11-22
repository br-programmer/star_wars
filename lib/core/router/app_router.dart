import 'package:go_router/go_router.dart';
import 'package:riverpod/riverpod.dart';
import 'package:star_wars/core/core.dart';
import 'package:star_wars/features/features.dart';

final routerProvider = Provider<GoRouter>(
  (ref) {
    final splashState = ref.watch(splashProvider);
    return GoRouter(
      initialLocation: Routes.splash.path,
      routes: AppRouter.routes,
      redirect: (routeState) {
        final location = routeState.location;
        final success = splashState == SplashState.success;
        if (location == Routes.splash.path && success) {
          return Routes.characters.path;
        }
        return null;
      },
    );
  },
);

class AppRouter {
  const AppRouter._();

  static List<GoRoute> get routes => [
        GoRoute(
          path: Routes.splash.path,
          name: Routes.splash.name,
          builder: SplashScreen.builder,
        ),
        GoRoute(
          path: Routes.characters.path,
          name: Routes.characters.name,
          builder: CharactersScreen.builder,
        ),
      ];
}
