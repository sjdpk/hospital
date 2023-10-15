import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'doctor_state.dart';
part 'doctor_event.dart';

class DoctorFormBloc extends Bloc<DoctorFormEvent, DoctorFormState> {
  DoctorFormBloc() : super(const DoctorFormInitialState()) {
    on<DoctorFormSumbitDataEvent>(onDoctorFormSumbitDataEvent);
  }

  FutureOr<void> onDoctorFormSumbitDataEvent(DoctorFormSumbitDataEvent event, Emitter<DoctorFormState> emit) async {
    emit(const DoctorFormSubmittingState());
    await Future.delayed(const Duration(seconds: 1), () {
      emit(DoctorFormSucessState(
        patientName: event.patientName,
        patientAge: event.patientAge,
        patientAddress: event.patientAddress,
        patientLabTest: event.patientLabTest,
      ));
    });
  }
}
