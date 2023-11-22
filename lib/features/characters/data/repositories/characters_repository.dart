import 'package:star_wars/core/core.dart';
import 'package:star_wars/features/features.dart';

class CharactersRepository implements ICharactersRepository {
  CharactersRepository({required Http http}) : _http = http;

  final Http _http;

  @override
  FutureHttpRequest<CharacterResponse> fetch(Paginate paginate) {
    return performHttpRequest(
      _http.send(
        APIServices.people,
        queryParameters: paginate.toJson(),
        parser: (_, json) => CharacterResponse.fromJson(json as Json),
      ),
    );
  }

  @override
  FutureHttpRequest<Film> film(String path) {
    return performHttpRequest(
      _http.send(
        path,
        parser: (_, json) => Film.fromJson(json as Json),
      ),
    );
  }
}
