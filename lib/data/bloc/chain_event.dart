part of 'chain_bloc.dart';

@freezed
class ChainEvent with _$ChainEvent {
  const factory ChainEvent.started() = _Started;
}