import 'package:get_it/get_it.dart';
import 'package:flutter_exam/core/domain/repositories/person_repository.dart';
import 'package:flutter_exam/features/person/domain/person_bloc.dart';

import '../core/domain/usecases/get_person_detail_use_case.dart';
import '../features/person/data/person_repository_impl.dart';

final sl = GetIt.asNewInstance();

/// It's a place to configure all the instances that are maintain by DI
/// to avoid boiler plate codes
void setupDependencies() {

  // Register all the possible Blocs
  sl.registerFactory(() => PersonBloc());

  // Register all the possible UseCases
  sl.registerLazySingleton(() => PersonUseCases(sl()));

  // Register all the possible Repositories
  sl.registerLazySingleton<PersonRepository>(() => PersonRepositoryImpl());
}
