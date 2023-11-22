import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:star_wars/core/core.dart';
import 'package:star_wars/features/features.dart';
import 'package:star_wars_ui/star_wars_ui.dart';

class CharactersList extends ConsumerWidget {
  const CharactersList({
    Key? key,
    required this.characters,
    required this.loadingMoreData,
    required this.hasReachedMax,
  }) : super(key: key);
  final List<Character> characters;
  final bool loadingMoreData;
  final bool hasReachedMax;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final charactersProvider = ref.read(charactersNotifier.notifier);
    final characters = this.characters.filter(ref.watch(StateNotifiers.gender));
    return SafeArea(
      child: InfiniteListView<Character>(
        items: characters,
        emptyView: const CharactersEmpty(),
        loadingMoreData: loadingMoreData,
        hasReachedMax: hasReachedMax,
        onLoadMore: () => charactersProvider.loadCharacters(reset: false),
        onRefresh: charactersProvider.loadCharacters,
        itemBuilder: (_, character) => CharacterCard(character: character),
        separatorBuilder: (_, __) => const Divider(
          color: Palette.cardBackground,
        ),
      ),
    );
  }
}
