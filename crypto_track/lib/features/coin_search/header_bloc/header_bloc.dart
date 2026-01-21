import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'header_event.dart';
part 'header_state.dart';

class HeaderBloc extends Bloc<HeaderEvent, HeaderState> {
  HeaderBloc() : super(HeaderInitial()) {
    on<HeaderSearchedEvent>(headerSearchedEvent);
    on<HeaderEmptyEvent>(headerEmptyEvent);
  }

  FutureOr<void> headerSearchedEvent(
    HeaderSearchedEvent event,
    Emitter<HeaderState> emit,
  ) {
    emit(HeaderSearchedState());
  }

  FutureOr<void> headerEmptyEvent(
    HeaderEmptyEvent event,
    Emitter<HeaderState> emit,
  ) {
    emit(HeaderTrendingState());
  }
}
