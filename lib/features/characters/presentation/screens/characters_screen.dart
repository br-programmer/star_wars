import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:star_wars/core/core.dart';
import 'package:star_wars/features/features.dart';
import 'package:star_wars_ui/star_wars_ui.dart';

class CharactersScreen extends ConsumerWidget {
  const CharactersScreen._({Key? key}) : super(key: key);

  static Widget builder(BuildContext _, GoRouterState __) {
    return const CharactersScreen._();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const CubeBuilder(size: 30)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: edgeInsetsH16,
            child: Text(
              'Star Wars Characters',
              style: context.textTheme.titleLarge,
            ),
          ),
          Expanded(
            child: ref.watch(charactersNotifier).maybeMap(
                  orElse: SizedBox.shrink,
                  loading: (_) => const CharacterLoadingStateWidget(),
                  loaded: (state) => CharacterLoadedStateWidget(
                    characters: state.characters,
                    loadingMoreData: state.loadingMoreData,
                    hasReachedMax: state.hasReachedMax,
                  ),
                ),
          ),
        ],
      ),
    );
  }
}
