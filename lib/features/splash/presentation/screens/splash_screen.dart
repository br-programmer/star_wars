import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:star_wars/core/core.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen._({Key? key}) : super(key: key);

  static Widget builder(BuildContext _, GoRouterState __) {
    return const SplashScreen._();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Expanded(child: Center(child: CubeBuilder())),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
