import 'package:flutter/material.dart';
import 'package:star_wars/features/features.dart';

class CharacterLoadedStateWidget extends StatelessWidget {
  const CharacterLoadedStateWidget({
    Key? key,
    required this.characters,
    required this.loadingMoreData,
    required this.hasReachedMax,
  }) : super(key: key);
  final List<Character> characters;
  final bool loadingMoreData;
  final bool hasReachedMax;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CharactersGender(),
        Expanded(
          child: CharactersList(
            characters: characters,
            loadingMoreData: loadingMoreData,
            hasReachedMax: hasReachedMax,
          ),
        ),
      ],
    );
  }
}
