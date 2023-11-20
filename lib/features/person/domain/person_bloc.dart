import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_exam/features/person/domain/person_event.dart';
import 'package:flutter_exam/features/person/domain/person_state.dart';

/// Register all the events of the Person module with the respective emitter to deliver state to the UI layer
/// Widget based business logics represents here
class PersonBloc extends Bloc<PersonEvent, PersonState> {
  PersonBloc() : super(InitialState()) {
    on<GetInitialList>(_onGetInitialList);
    on<GetPaginatedList>(_onGetPaginatedList);
    on<GetPaginatedList>(_onGetPaginatedList);
    on<GetDetail>(_onGetDetail);
  }

  FutureOr<void> _onGetInitialList(
      GetInitialList event, Emitter<PersonState> emit) {}

  FutureOr<void> _onGetPaginatedList(
      GetPaginatedList event, Emitter<PersonState> emit) {}

  FutureOr<void> _onGetDetail(GetDetail event, Emitter<PersonState> emit) {}
}
