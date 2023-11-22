import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:star_wars/features/features.dart';

part 'character_response.freezed.dart';
part 'character_response.g.dart';

@freezed
class CharacterResponse with _$CharacterResponse {
  factory CharacterResponse({
    required int count,
    Uri? next,
    Uri? previous,
    @Default([]) @JsonKey(name: 'results') List<Character> characters,
  }) = _CharacterResponse;

  factory CharacterResponse.fromJson(Map<String, dynamic> json) =>
      _$CharacterResponseFromJson(json);
}
