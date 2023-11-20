import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
abstract class PersonEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class GetInitialList extends PersonEvent {
  @override
  List<Object?> get props => [];
}

class GetPaginatedList extends PersonEvent {
  @override
  List<Object?> get props => [];
}

class GetDetail extends PersonEvent {
  final int id;

  GetDetail(this.id);

  @override
  List<Object?> get props => [id];
}
