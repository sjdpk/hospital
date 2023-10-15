import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hospital/src/config/router/routes.dart';
import 'package:hospital/src/core/widgets/button.dart';
import 'package:hospital/src/features/lab/presentation/bloc/lab_bloc.dart';
import 'package:hospital/src/features/lab/presentation/widgets/lab_widget.dart';

class ReportResultScreen extends StatelessWidget {
  const ReportResultScreen({super.key});

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
          title: const Text('Lab Report Result'),
        ),
        body: BlocBuilder<LabFormBloc, LabFormState>(
          builder: (context, state) {
            if (state is LabFormSucessState) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: ListView(
                  children: <Widget>[
                    const Text(
                      'Test result:',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 30),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        if (constraints.maxWidth > 600) {
                          // On larger screens, display the DataTable with horizontal scroll
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
                                    'Lab test name',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Test result',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    'Reference range',
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                              rows: <DataRow>[
                                DataRow(
                                  cells: <DataCell>[
                                    DataCell(Text(state.labTestName ?? "")),
                                    DataCell(Text(state.labTestName ?? "")),
                                    DataCell(Text(state.referenceRange ?? "")),
                                  ],
                                ),
                                // Add more DataRow widgets for additional test results if needed
                              ],
                            ),
                          );
                       
                        } else {
                          // On smaller screens, display the content in a column
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              LabWidgets.resultInfo(name: "Lab test name", data: state.labTestName ?? ""),
                              LabWidgets.resultInfo(name: "Test result", data: state.labTestName ?? ""),
                              LabWidgets.resultInfo(name: "Reference range", data: state.referenceRange ?? ""),
                            ],
                          );
                        }
                      },
                    ),
                  ],
                ),
              );
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
