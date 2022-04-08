import 'dart:io';

import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

class DoctorRepositoryImpl implements DoctorRepository {
  final RemoteDataSource remoteDataSource;

  DoctorRepositoryImpl({
    required this.remoteDataSource,
  });

  @override
  Future<Either<Failure, List<Doctor>>> getDoctorList() async {
    try {
      final result = await remoteDataSource.getDoctorList();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    } catch (e) {
      return Left(CommonFailure(e.toString()));
    }
  }
}
