import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'person_event.dart';

part 'person_state.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {
  PersonBloc() : super(const PersonInitial()) {
    on<AliCalled>(_aliCalled);
    on<HossainCalled>(_hossainCalled);
    on<CousinsCalled>(_cousinsCalled);
  }

  void _aliCalled(
    AliCalled event,
    Emitter<PersonState> emit,
  ) {
    emit(AliState.from(state, father: event.parentName));
  }

  void _hossainCalled(
    HossainCalled event,
    Emitter<PersonState> emit,
  ) {
    emit(
      HossainState.from(
        state,
        mother: event.parentName,
      ),
    );
  }

  void _cousinsCalled(
    CousinsCalled event,
    Emitter<PersonState> emit,
  ) async {
    emit(
      CousinsState.from(
        state,
        loadState: LoadState.loading,
      ),
    );

    await Future.delayed(
      const Duration(seconds: 1),
    );

    if (event.goFailed) {
      emit(
        (state as CousinsState).copyWith(
          loadState: LoadState.error,
          error: 'error',
        ),
      );
    } else {
      emit(
        (state as CousinsState).copyWith(
          loadState: LoadState.response,
          cousins: const ['1', '2', '3'],
        ),
      );
    }
  }
}
