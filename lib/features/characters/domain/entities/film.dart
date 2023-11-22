import 'package:freezed_annotation/freezed_annotation.dart';

part 'film.freezed.dart';
part 'film.g.dart';

@freezed
class Film with _$Film {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory Film({
    required String title,
    required int episodeId,
    required String openingCrawl,
    required String director,
    required String producer,
    required String releaseDate,
    required List<Uri> characters,
    required List<Uri> planets,
    required List<Uri> starships,
    required List<Uri> vehicles,
    required List<Uri> species,
    required DateTime created,
    required DateTime edited,
    required Uri url,
  }) = _Film;

  factory Film.fromJson(Map<String, dynamic> json) => _$FilmFromJson(json);
}
