import 'package:flutter_exam/core/domain/entities/person.dart';
import 'package:flutter_exam/core/domain/repositories/person_repository.dart';

/// This class has the implementation of all the abstracted functions of Person module
/// to extract the data from the Data layer
class PersonRepositoryImpl implements PersonRepository {
  @override
  Future<List<Person>> getPersonList() async {
    //TODO: Codes will be updated with actual implementations
    await Future.delayed(const Duration(seconds: 2));
    return [];
  }
}
