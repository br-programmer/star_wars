import 'package:flutter/material.dart';
import 'package:star_wars_ui/star_wars_ui.dart';

class CharactersEmpty extends StatelessWidget {
  const CharactersEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.info),
        gap4,
        Text(
          'No characters found...',
          style: context.textTheme.bodyText1,
        ),
      ],
    );
  }
}
