class PatientRecordEntity {
  final String name;
  final int age;
  final String address;
  final String laboratoryTest;
  final DateTime labOrderDate;

  PatientRecordEntity({
    required this.name,
    required this.age,
    required this.address,
    required this.laboratoryTest,
    required this.labOrderDate,
  });
}
