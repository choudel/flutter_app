import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chain_event.dart';
part 'chain_state.dart';
part 'chain_bloc.freezed.dart';

class ChainBloc extends Bloc<ChainEvent, ChainState> {
  ChainBloc() : super(_Initial()) {
    on<ChainEvent>((event, emit) {});
  }
}
