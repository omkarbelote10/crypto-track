import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_event.freezed.dart';

@freezed
class SearchEvent with _$SearchEvent{
  const factory SearchEvent.started() = SearchStarted;
  const factory SearchEvent.queryChanged(
      final String query,
      ) = SearchQueryChanged;
}
