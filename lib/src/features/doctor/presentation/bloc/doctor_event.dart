part of 'doctor_bloc.dart';

class DoctorFormEvent extends Equatable {
  const DoctorFormEvent();
  @override
  List<Object?> get props => [];
}

class DoctorFormSumbitDataEvent extends DoctorFormEvent {
  final String? patientName;
  final int? patientAge;
  final String? patientAddress;
  final String? patientLabTest;
  const DoctorFormSumbitDataEvent({this.patientName, this.patientAge, this.patientAddress, this.patientLabTest});

  @override
  List<Object?> get props => [
        patientName,
        patientAge,
        patientAddress,
        patientLabTest,
      ];
}
