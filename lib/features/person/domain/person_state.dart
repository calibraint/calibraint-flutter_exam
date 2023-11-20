import 'package:equatable/equatable.dart';
import '../../../core/domain/entities/person.dart';

class PersonState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialState extends PersonState {}

class LoadingState extends PersonState {
  @override
  List<Object?> get props => [];
}

class PersonListState extends Equatable {
  final List<Person> persons;

  const PersonListState(this.persons);

  @override
  List<Object?> get props => [persons];
}

class PersonDetailState extends Equatable {
  final Person person;

  const PersonDetailState(this.person);

  @override
  List<Object?> get props => [person];
}
