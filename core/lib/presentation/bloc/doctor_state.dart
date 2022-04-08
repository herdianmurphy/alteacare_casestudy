part of 'doctor_bloc.dart';

abstract class DoctorState extends Equatable {
  const DoctorState();

  @override
  List<Object> get props => [];
}

class DoctorInitial extends DoctorState {}

class DoctorLoading extends DoctorState {}

class DoctorLoaded extends DoctorState {
  final List<Doctor> data;

  DoctorLoaded(this.data);

  @override
  List<Object> get props => [data];
}

class DoctorError extends DoctorState {
  final String message;

  DoctorError(this.message);

  @override
  List<Object> get props => [message];
}