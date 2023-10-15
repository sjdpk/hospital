part of 'lab_bloc.dart';

class SubmitFormEvent extends Equatable {
  const SubmitFormEvent();
  @override
  List<Object?> get props => [];
}

class LabFormSumbitDataEvent extends SubmitFormEvent {
  final String? labTestName;
  final String? testResult;
  final String? referenceRange;
  const LabFormSumbitDataEvent({this.labTestName, this.testResult, this.referenceRange});

  @override
  List<Object?> get props => [
        labTestName,
        testResult,
        referenceRange,
      ];
}
