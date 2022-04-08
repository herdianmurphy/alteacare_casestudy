import 'package:bloc/bloc.dart';
import 'package:core/core.dart';
import 'package:equatable/equatable.dart';

part 'doctor_event.dart';
part 'doctor_state.dart';

class DoctorBloc extends Bloc<DoctorEvent, DoctorState> {
  final GetDoctorList _getDoctorList;

  DoctorBloc(this._getDoctorList) : super(DoctorInitial()) {
    on<FetchDoctorList>((event, emit) async {

      emit(DoctorLoading());
      final result = await _getDoctorList.execute();

      result.fold(
        (failure) {
          emit(DoctorError(failure.message));
        },
        (data) {
          emit(DoctorLoaded(data));
        },
      );
    });
  }
}