import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/src/config/router/routes.dart';
import 'package:hospital/src/core/widgets/button.dart';
import 'package:hospital/src/features/doctor/presentation/bloc/doctor_bloc.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacementNamed(context, AppRoutes.homeRoute);
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.pushReplacementNamed(context, AppRoutes.homeRoute),
          ),
          title: const Text('Lab Report'),
        ),
        body: BlocBuilder<DoctorFormBloc, DoctorFormState>(
          builder: (context, state) {
            if (state is DoctorFormSucessState) {
              return LayoutBuilder(builder: (context, constraints) {
                if (constraints.maxWidth > 600) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                      showBottomBorder: true,
                      border: TableBorder.all(
                        color: Colors.grey.shade300,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                      columns: const <DataColumn>[
                        DataColumn(
                          label: Text(
                            'Patient’s name',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Patient’s age (years)',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Patient’s address',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Date',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                      rows: <DataRow>[
                        DataRow(
                          cells: <DataCell>[
                            DataCell(Text(state.patientRecordEntity?.name ?? "")),
                            DataCell(Text("${state.patientRecordEntity?.age ?? ""}")),
                            DataCell(Text(state.patientRecordEntity?.address ?? "")),
                            DataCell(Text(state.patientRecordEntity!.labOrderDate.toString().split(' ')[0])),
                          ],
                        ),
                        // Add more DataRow widgets for additional test results if needed
                      ],
                    ),
                  );
                }
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Patient’s name: ${state.patientRecordEntity?.name ?? ""}',
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Patient’s age: ${state.patientRecordEntity?.age ?? ""} years',
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Patient’s address: ${state.patientRecordEntity?.address ?? ""}',
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Lab result date: ${state.patientRecordEntity!.labOrderDate.toString().split(' ')[0]}',
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                );
              });
            } else {
              return Center(
                child: AppButton(
                  onPressed: () => Navigator.pushReplacementNamed(context, AppRoutes.homeRoute),
                  title: "Home Page",
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
