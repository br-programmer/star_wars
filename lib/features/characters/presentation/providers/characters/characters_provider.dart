import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:star_wars/core/core.dart';
import 'package:star_wars/features/characters/characters.dart';

part 'characters_provider.freezed.dart';
part 'characters_state.dart';

final charactersNotifier =
    StateNotifierProvider<CharactersProvider, CharactersState>(
  (ref) => CharactersProvider(
    CharactersState.initial(),
    charactersRepository: ref.read(Repositories.character),
  )..loadCharacters(),
);

class CharactersProvider extends StateNotifier<CharactersState> {
  CharactersProvider(
    CharactersState state, {
    required ICharactersRepository charactersRepository,
  })  : _charactersRepository = charactersRepository,
        super(state);
  final ICharactersRepository _charactersRepository;

  CharactersLoadedState get loadedState => state.maybeMap(
        loaded: (value) => value,
        orElse: () => throw AssertionError(),
      );

  Paginate get _paginate => state.maybeMap(
        orElse: Paginate.new,
        loaded: (value) => value.paginate ?? Paginate(),
      );

  CharactersState _state(bool reset) {
    if (reset) {
      return const CharactersState.loading();
    }
    return state.maybeMap(
      orElse: CharactersState.loading,
      loaded: (state) => state.copyWith(loadingMoreData: true),
    );
  }

  CharactersState _charactersFailureResponse(HttpRequestFailure failure) {
    return state.maybeMap(
      loaded: (value) => value.copyWith(loadingMoreData: false),
      orElse: () => CharactersState.error(failure: failure),
    );
  }

  CharactersState _characterSuccessResponse(CharacterResponse response) {
    final next = response.next;
    Paginate? paginate;
    final queryParameters = next?.queryParameters;
    if (queryParameters != null) {
      paginate = Paginate.fromJson(queryParameters);
    }
    final characters = response.characters;
    return state.maybeMap(
      orElse: () => CharactersState.loaded(
        characters: characters,
        hasReachedMax: response.next != null,
        paginate: paginate,
      ),
      loaded: (state) => state.copyWith(
        characters: [...state.characters, ...characters],
        loadingMoreData: false,
        hasReachedMax: response.next != null,
        paginate: paginate,
      ),
    );
  }

  Future<void> loadCharacters({bool reset = true}) async {
    state = _state(reset);
    final result = await _charactersRepository.fetch(_paginate);
    state = result.when(
      left: _charactersFailureResponse,
      right: _characterSuccessResponse,
    );
  }
}
