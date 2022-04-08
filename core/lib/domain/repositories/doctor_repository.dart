import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

abstract class DoctorRepository {
  Future<Either<Failure, List<Doctor>>> getDoctorList();
}
