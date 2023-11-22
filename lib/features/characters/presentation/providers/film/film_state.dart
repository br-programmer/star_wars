part of 'film_provider.dart';

@freezed
class FilmState with _$FilmState {
  const factory FilmState.loading() = _FilmLoading;
  const factory FilmState.success({
    required Film film,
  }) = _FilmSuccess;
  const factory FilmState.error({
    required HttpRequestFailure failure,
  }) = _FilmError;
}
