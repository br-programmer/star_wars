import 'package:flutter/material.dart';
import 'package:star_wars/features/features.dart';

extension GenderX on Gender {
  String get name {
    switch (this) {
      case Gender.all:
        return 'All';
      case Gender.male:
        return 'Male';
      case Gender.female:
        return 'Female';
      case Gender.unknown:
        return 'Unknown';
      case Gender.nA:
        return 'N/A';
      case Gender.others:
        return 'Others';
      // case Gender.hermaphrodite:
      //   return 'Hermaphrodite';
      // case Gender.none:
      //   return 'None';
    }
  }

  bool selected(Gender gender) => gender == this;

  bool get all => this == Gender.all;

  Color color(Gender gender) {
    if (selected(gender)) {
      return Colors.red;
    }
    return Colors.red.withOpacity(.25);
  }
}
