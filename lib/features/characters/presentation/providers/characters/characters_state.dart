part of 'characters_provider.dart';

@freezed
class CharactersState with _$CharactersState {
  factory CharactersState.initial() = _CharactersInitialState;
  const factory CharactersState.loading() = _CharactersListLoadingState;
  const factory CharactersState.loaded({
    required List<Character> characters,
    Paginate? paginate,
    @Default(false) bool loadingMoreData,
    @Default(false) bool hasReachedMax,
  }) = CharactersLoadedState;
  const factory CharactersState.error({
    required HttpRequestFailure failure,
  }) = _CharactersErrorState;
}
