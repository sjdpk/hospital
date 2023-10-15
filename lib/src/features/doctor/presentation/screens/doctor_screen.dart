import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/src/config/router/routes.dart';
import 'package:hospital/src/core/extensions/widget_extensions.dart';
import 'package:hospital/src/core/utils/validator.dart';
import 'package:hospital/src/core/widgets/appdialog.dart';
import 'package:hospital/src/core/widgets/button.dart';
import 'package:hospital/src/core/widgets/snackbar.dart';
import 'package:hospital/src/core/widgets/textform.dart';
import 'package:hospital/src/features/doctor/presentation/bloc/doctor_bloc.dart';

import '../../domain/entity/patient_record_entity.dart';

class DoctorHomeScreen extends StatelessWidget {
  DoctorHomeScreen({super.key});
  final _formKey = GlobalKey<FormState>();
  final _patientNameController = TextEditingController();
  final _patientAgeController = TextEditingController();
  final _patientAddressController = TextEditingController();
  final _patientLabTestController = TextEditingController();

  void submitForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final PatientRecordEntity patientRecordEntity = PatientRecordEntity(
        name: _patientNameController.text,
        age: int.parse(_patientAgeController.text),
        address: _patientAddressController.text,
        laboratoryTest: _patientLabTestController.text,
        labOrderDate: DateTime.now(),
      );

      context.read<DoctorFormBloc>().add(
            DoctorFormSumbitDataEvent(patientRecordEntity: patientRecordEntity),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Lab requisition form",
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: BlocConsumer<DoctorFormBloc, DoctorFormState>(
        listener: (context, state) {
          if (state is DoctorFormSubmittingState) {
            showAppDialog(
              context,
              barrierDismissible: false,
              titleWidget: const Center(child: CircularProgressIndicator()),
              contentWidget: const Text(
                "Submitting form...",
                overflow: TextOverflow.visible,
                textAlign: TextAlign.center,
              ),
            );
          } else if (state is DoctorFormSucessState) {
            Navigator.pop(context);
            Navigator.pushNamed(context, AppRoutes.reportRoute);
          } else if (state is SubmitFormStateErrorState) {
            Navigator.pop(context);
            AppSnackbar.show(context, state.message ?? "Something went wrong, try again", type: AppSnackBarType.error);
          }
        },
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: ListView(
              padding: const EdgeInsets.all(18),
              children: [
                AppTextField(
                  controller: _patientNameController,
                  hintText: "Patient Name",
                  validator: AppValidator.fullName,
                ).paddingOnly(bottom: 16),
                AppTextField(
                  controller: _patientAgeController,
                  inputfieldLimit: 3,
                  hintText: "Patient Age",
                  isNumberKeyboard: true,
                  validator: AppValidator.age,
                ).paddingOnly(bottom: 16),
                AppTextField(
                  controller: _patientAddressController,
                  hintText: "Patient Address",
                  validator: AppValidator.emptyField,
                ).paddingOnly(bottom: 16),
                AppTextField(
                  controller: _patientLabTestController,
                  hintText: "Patient Lab Test",
                  validator: AppValidator.emptyField,
                ).paddingOnly(bottom: 16),
                AppButton(
                  onPressed: () => submitForm(context),
                  title: "Submit",
                )
              ],
            ).paddingOnly(bottom: 16),
          );
        },
      ),
    );
  }
}
