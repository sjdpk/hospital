// This is a part of the 'submitform_bloc.dart' file.
part of 'doctor_bloc.dart';

// Define an abstract class 'SubmitFormState' to represent the various states of the Form handling process.
abstract class DoctorFormState extends Equatable {
  final PatientRecordEntity? patientRecordEntity;
  const DoctorFormState({
    this.patientRecordEntity,
  });
  @override
  List<Object?> get props => [
        patientRecordEntity
      ];
}

// Represents the state when the Form loading process is in progress.
class DoctorFormInitialState extends DoctorFormState {
  const DoctorFormInitialState();
}

class DoctorFormSubmittingState extends DoctorFormState {
  const DoctorFormSubmittingState();
}

class DoctorFormSucessState extends DoctorFormState {
  const DoctorFormSucessState({super.patientRecordEntity});
  @override
  List<Object?> get props => [
        patientRecordEntity
      ];
}

// Represents the state when there is an error in  the location handling process.
class SubmitFormStateErrorState extends DoctorFormState {
  final String? message;
  const SubmitFormStateErrorState(this.message);
  @override
  List<Object?> get props => [
        message
      ];
}
