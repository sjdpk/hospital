part of 'lab_bloc.dart';

class SubmitFormEvent extends Equatable {
  const SubmitFormEvent();
  @override
  List<Object?> get props => [];
}

class LabFormSumbitDataEvent extends SubmitFormEvent {
  final LabTestRecordEntity? labTestRecordEntity;

  const LabFormSumbitDataEvent({this.labTestRecordEntity});

  @override
  List<Object?> get props => [
        labTestRecordEntity
      ];
}
