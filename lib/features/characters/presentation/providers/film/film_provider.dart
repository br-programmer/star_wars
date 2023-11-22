import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:star_wars/core/core.dart';
import 'package:star_wars/features/features.dart';

part 'film_provider.freezed.dart';
part 'film_state.dart';

final filmProvider =
    StateNotifierProviderFamily<FilmProvider, FilmState, String>(
  (ref, path) => FilmProvider(
    const FilmState.loading(),
    charactersRepository: ref.read(Repositories.character),
    path: path,
  )..loadFilm(),
);

class FilmProvider extends StateNotifier<FilmState> {
  FilmProvider(
    FilmState state, {
    required ICharactersRepository charactersRepository,
    required String path,
  })  : _charactersRepository = charactersRepository,
        _path = path,
        super(state);

  final ICharactersRepository _charactersRepository;
  final String _path;

  Future<void> loadFilm() async {
    final result = await _charactersRepository.film(_path);
    state = result.when(
      left: (failure) => FilmState.error(failure: failure),
      right: (film) => FilmState.success(film: film),
    );
  }
}
