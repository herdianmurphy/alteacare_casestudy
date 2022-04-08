import 'package:core/core.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void init() {
  // bloc
  locator.registerFactory(
    () => DoctorBloc(
      locator(),
    ),
  );

  // use case
  locator.registerLazySingleton(() => GetDoctorList(locator()));

  // repository
  locator.registerLazySingleton<DoctorRepository>(
    () => DoctorRepositoryImpl(
      remoteDataSource: locator(),
    ),
  );

  // data sources
  locator.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(client: locator()));

  // external
  locator.registerLazySingleton(() => http.Client());
}
