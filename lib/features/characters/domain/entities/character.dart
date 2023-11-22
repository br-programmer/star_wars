import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:star_wars/features/features.dart';
import 'package:star_wars_ui/star_wars_ui.dart';

part 'character.freezed.dart';
part 'character.g.dart';

@freezed
class Character with _$Character {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory Character({
    required String name,
    required String height,
    required String mass,
    required String hairColor,
    required String skinColor,
    required String eyeColor,
    required String birthYear,
    @JsonKey(fromJson: _fromJson) required Gender gender,
    required Uri homeworld,
    required DateTime created,
    required DateTime edited,
    required Uri url,
    @Default([]) List<Uri> films,
    @Default([]) List<Uri> species,
    @Default([]) List<Uri> vehicles,
    @Default([]) List<Uri> starships,
  }) = _Character;

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);
}

const _genderEnumMap = {
  Gender.all: 'all',
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.unknown: 'unknown',
  Gender.nA: 'n/a',
};

Gender _fromJson(String gender) {
  for (final entry in _genderEnumMap.entries) {
    if (entry.value == gender) {
      return entry.key;
    }
  }
  return Gender.others;
}

enum Gender { all, male, female, unknown, nA, others }

extension CharacterListX on List<Character> {
  List<Character> filter(Gender gender) {
    if (gender.all) {
      return this;
    }
    return whereList((c) => c.gender == gender);
  }
}
