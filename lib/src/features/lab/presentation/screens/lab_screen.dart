import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/src/config/router/routes.dart';
import 'package:hospital/src/core/extensions/widget_extensions.dart';
import 'package:hospital/src/core/utils/validator.dart';
import 'package:hospital/src/core/widgets/appdialog.dart';
import 'package:hospital/src/core/widgets/button.dart';
import 'package:hospital/src/core/widgets/snackbar.dart';
import 'package:hospital/src/core/widgets/textform.dart';
import 'package:hospital/src/features/lab/presentation/bloc/lab_bloc.dart';

import '../../domain/entity/lab_result_entity.dart';

class LabHomeScreen extends StatelessWidget {
  LabHomeScreen({super.key});
  final _formKey = GlobalKey<FormState>();

  final _labTestNameController = TextEditingController();
  final _testResultController = TextEditingController();
  final _referenceRangeController = TextEditingController();

  void submitForm(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      LabTestRecordEntity labTestRecordEntity = LabTestRecordEntity(
        labTestName: _labTestNameController.text,
        testResult: _testResultController.text,
        referenceRange: _referenceRangeController.text,
      );
      context.read<LabFormBloc>().add(LabFormSumbitDataEvent(labTestRecordEntity: labTestRecordEntity));
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
      body: BlocConsumer<LabFormBloc, LabFormState>(
        listener: (context, state) {
          if (state is LabFormSubmittingState) {
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
          } else if (state is LabFormSucessState) {
            Navigator.pop(context);
            Navigator.pushNamed(context, AppRoutes.resultRoute);
          } else if (state is LabFormErrorState) {
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
                  controller: _labTestNameController,
                  hintText: "Lab Test Name",
                  validator: AppValidator.fullName,
                ).paddingOnly(bottom: 16),
                AppTextField(
                  controller: _testResultController,
                  hintText: "Test Result",
                  validator: AppValidator.emptyField,
                ).paddingOnly(bottom: 16),
                AppTextField(
                  controller: _referenceRangeController,
                  hintText: "Reference range",
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
