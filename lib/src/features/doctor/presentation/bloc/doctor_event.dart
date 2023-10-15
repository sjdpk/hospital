part of 'doctor_bloc.dart';

class DoctorFormEvent extends Equatable {
  const DoctorFormEvent();
  @override
  List<Object?> get props => [];
}

class DoctorFormSumbitDataEvent extends DoctorFormEvent {
  final PatientRecordEntity? patientRecordEntity;

  const DoctorFormSumbitDataEvent({this.patientRecordEntity});

  @override
  List<Object?> get props => [
        patientRecordEntity
      ];
}
