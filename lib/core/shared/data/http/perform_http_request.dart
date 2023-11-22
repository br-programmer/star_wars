import 'dart:io';

import 'package:star_wars/core/core.dart';

FutureEither<HttpRequestFailure, T> performHttpRequest<T>(
  Future<HttpResult<T>> future,
) async {
  final result = await future;
  return result.when(
    success: (_, value) => Either.right(value),
    failed: (statusCode, error) {
      if (error is SocketException) {
        return Either.left(HttpRequestFailure.network());
      }
      HttpRequestFailure? failure;
      switch (statusCode) {
        case HttpStatus.forbidden:
          failure = HttpRequestFailure.forbidden();
          break;
        case HttpStatus.unauthorized:
          failure = HttpRequestFailure.unauthorized();
          break;
        case HttpStatus.notFound:
          failure = HttpRequestFailure.notFound();
          break;
        case HttpStatus.unprocessableEntity:
          failure = HttpRequestFailure.unprocessableEntity();
          break;
        case HttpStatus.internalServerError:
          failure = HttpRequestFailure.server();
          break;
      }
      failure ??= HttpRequestFailure.unhandledException(error: error);
      return Either.left(failure);
    },
  );
}
