import 'package:flutter/material.dart';
import 'package:star_wars/features/features.dart';
import 'package:star_wars_ui/star_wars_ui.dart';

class CharacterLoadingStateWidget extends StatelessWidget {
  const CharacterLoadingStateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        IgnorePointer(child: CharactersGender()),
        Expanded(
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Palette.primary),
            ),
          ),
        ),
      ],
    );
  }
}
