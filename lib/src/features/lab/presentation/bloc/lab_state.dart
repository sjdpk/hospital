// This is a part of the 'submitform_bloc.dart' file.
part of 'lab_bloc.dart';

// Define an abstract class 'SubmitFormState' to represent the various states of the Form handling process.
abstract class LabFormState extends Equatable {
  final LabTestRecordEntity? labTestRecordEntity;
  const LabFormState({this.labTestRecordEntity});
  @override
  List<Object?> get props => [
        labTestRecordEntity
      ];
}

// Represents the state when the Form loading process is in progress.
class LabFormInitialState extends LabFormState {
  const LabFormInitialState();
}

class LabFormSubmittingState extends LabFormState {
  const LabFormSubmittingState();
}

class LabFormSucessState extends LabFormState {
  const LabFormSucessState({super.labTestRecordEntity});
  @override
  List<Object?> get props => [
        labTestRecordEntity
      ];
}

// Represents the state when there is an error in  the location handling process.
class LabFormErrorState extends LabFormState {
  final String? message;
  const LabFormErrorState(this.message);
  @override
  List<Object?> get props => [
        message
      ];
}
