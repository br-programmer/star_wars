import 'package:riverpod/riverpod.dart';
import 'package:star_wars/core/core.dart';
import 'package:star_wars/features/features.dart';

class Repositories {
  const Repositories._();
  static final character = Provider<ICharactersRepository>(
    (ref) => CharactersRepository(http: ref.read(Providers.http)),
  );
}
