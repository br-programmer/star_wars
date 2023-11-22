import 'package:star_wars/core/core.dart';
import 'package:star_wars/features/features.dart';

abstract class ICharactersRepository {
  FutureHttpRequest<CharacterResponse> fetch(Paginate paginate);
  FutureHttpRequest<Film> film(String path);
}
