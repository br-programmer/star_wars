import 'package:freezed_annotation/freezed_annotation.dart';

part 'paginate.freezed.dart';
part 'paginate.g.dart';

@freezed
class Paginate with _$Paginate {
  factory Paginate({@Default('1') String page}) = _Paginate;

  factory Paginate.fromJson(Map<String, dynamic> json) =>
      _$PaginateFromJson(json);
}
