import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_rest_result.freezed.dart';

@freezed
class APIResult with _$APIResult {
  const factory APIResult.succeeded({Object? data}) = Succeeded;
  const factory APIResult.failed({Map<String, dynamic>? data}) = Failed;
  const factory APIResult.error(String message) = Error;
}
