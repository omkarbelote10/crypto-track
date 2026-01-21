import 'package:freezed_annotation/freezed_annotation.dart';
part 'connectivity_event.freezed.dart';

@Freezed()
abstract class ConnectivityEvent with _$ConnectivityEvent{
  const factory ConnectivityEvent.changed({
    required bool isConnected,
}) = ConnectivityChanged;

}