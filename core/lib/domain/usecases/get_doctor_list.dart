import 'package:core/core.dart';
import 'package:dartz/dartz.dart';

class GetDoctorList {
  final DoctorRepository repository;

  GetDoctorList(this.repository);

  Future<Either<Failure, List<Doctor>>> execute() {
    return repository.getDoctorList();
  }
}
