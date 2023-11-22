import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:star_wars/core/core.dart';
import 'package:star_wars_ui/star_wars_ui.dart';

class StarWarsApp extends ConsumerWidget {
  const StarWarsApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      debugShowCheckedModeBanner: false,
      theme: StarWarsTheme.light,
      darkTheme: StarWarsTheme.dark,
    );
  }
}
