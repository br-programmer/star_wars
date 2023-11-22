import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:star_wars/core/core.dart';
import 'package:star_wars/features/features.dart';
import 'package:star_wars_ui/star_wars_ui.dart';

class CharactersGender extends StatelessWidget {
  const CharactersGender({Key? key}) : super(key: key);

  EdgeInsets _padding(Gender gender) {
    if (gender == Gender.values.first) {
      return edgeInsetsL15.copyWith(right: 4);
    }
    if (gender == Gender.values.last) {
      return edgeInsetsR15.copyWith(left: 4);
    }
    return edgeInsetsH4;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (_, ref, __) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: edgeInsetsV16,
          child: Row(
            children: Gender.values.mapList(
              (gender) => Padding(
                padding: _padding(gender),
                child: StarWarsCustomChip(
                  enable: gender.selected(ref.watch(StateNotifiers.gender)),
                  onPressed: () {
                    ref.read(StateNotifiers.gender.notifier).change(gender);
                  },
                  text: gender.name,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
