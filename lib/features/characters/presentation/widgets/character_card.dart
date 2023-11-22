import 'package:flutter/material.dart';
import 'package:star_wars/features/features.dart';
import 'package:star_wars_ui/star_wars_ui.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({Key? key, required this.character}) : super(key: key);
  final Character character;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: edgeInsetsH16,
      child: ListTile(
        contentPadding: edgeInsetsZero,
        onTap: () => FilmsModal.show(context, character: character),
        title: _RowTwoTexts(
          textOne: 'Name:',
          textTwo: character.name,
        ),
        subtitle: _RowTwoTexts(
          textOne: 'Gender:',
          textTwo: character.gender.name,
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}

class _RowTwoTexts extends StatelessWidget {
  const _RowTwoTexts({
    Key? key,
    required this.textOne,
    required this.textTwo,
  }) : super(key: key);

  final String textOne;
  final String textTwo;

  @override
  Widget build(BuildContext context) {
    final titleLargeTextStyle = context.textTheme.titleLarge!.copyWith(
      fontWeight: AppFontWeight.semiBold,
    );
    return Row(
      children: [
        Text(
          textOne,
          style: titleLargeTextStyle.copyWith(
            fontWeight: AppFontWeight.regular,
          ),
        ),
        space4,
        Text(textTwo, style: titleLargeTextStyle),
      ],
    );
  }
}
