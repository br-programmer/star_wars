import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:star_wars/features/characters/characters.dart';
import 'package:star_wars_ui/star_wars_ui.dart';

class FilmsModal extends StatelessWidget {
  const FilmsModal._({
    Key? key,
    required this.character,
  }) : super(key: key);
  final Character character;

  static void show(
    BuildContext context, {
    required Character character,
  }) {
    StarWarsBaseModal.show(
      context,
      (_) => StarWarsBaseModal(
        child: FilmsModal._(character: character),
      ),
      isScrollControlled: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final films = character.films;
    return SizedBox(
      height: context.height * .4,
      child: Padding(
        padding: edgeInsets16,
        child: Column(
          children: [
            Text(
              '${character.name} participated in the following films',
              style: context.textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            gap16,
            Expanded(
              child: InfiniteListView<Uri>(
                items: films,
                itemBuilder: (_, film) => FilmWidget(path: film.path),
                emptyView: const Center(
                  child: Text(
                    'This character has not participated in any movie',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FilmWidget extends ConsumerWidget {
  const FilmWidget({Key? key, required this.path}) : super(key: key);
  final String path;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: edgeInsetsV4,
      child: ref.watch(filmProvider(path)).maybeMap(
            orElse: SizedBox.shrink,
            loading: (_) => StarWarsBaseShimmer(
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: context.width * .4,
                  height: 8,
                  child: const DecoratedBox(
                    decoration: BoxDecoration(color: Palette.grey),
                  ),
                ),
              ),
            ),
            success: (state) => Text(
              state.film.title,
              style: context.textTheme.titleMedium?.copyWith(
                fontWeight: AppFontWeight.regular,
              ),
            ),
          ),
    );
  }
}
