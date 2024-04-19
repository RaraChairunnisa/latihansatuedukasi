import 'package:flutter/material.dart';

class Employee {
  final String name;
  final String employeeId;
  final String phoneNumber;
  final String email;
  final DateTime inputDate;

  Employee({
    required this.name,
    required this.employeeId,
    required this.phoneNumber,
    required this.email,
    required this.inputDate,
  });
}

class PageListPegawai extends StatefulWidget {
  const PageListPegawai({Key? key}) : super(key: key);

  @override
  _PageListPegawaiState createState() => _PageListPegawaiState();
}

class _PageListPegawaiState extends State<PageListPegawai> {
  final List<Employee> employees = [];

  TextEditingController nameController = TextEditingController();
  TextEditingController employeeIdController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  void addEmployee(BuildContext context) {
    final String name = nameController.text;
    final String employeeId = employeeIdController.text;
    final String phoneNumber = phoneNumberController.text;
    final String email = emailController.text;
    final DateTime inputDate = DateTime.now();

    if (name.isNotEmpty &&
        employeeId.isNotEmpty &&
        phoneNumber.isNotEmpty &&
        email.isNotEmpty) {
      Employee newEmployee = Employee(
        name: name,
        employeeId: employeeId,
        phoneNumber: phoneNumber,
        email: email,
        inputDate: inputDate,
      );
      setState(() {
        employees.add(newEmployee);
      });

      // Clear text fields after adding employee
      nameController.clear();
      employeeIdController.clear();
      phoneNumberController.clear();
      emailController.clear();
    } else {
      // Show error message if any field is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Harap isi semua bidang.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Pegawai'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Nama'),
                ),
                TextField(
                  controller: employeeIdController,
                  decoration: InputDecoration(labelText: 'Nomor BP'),
                ),
                TextField(
                  controller: phoneNumberController,
                  decoration: InputDecoration(labelText: 'Nomor HP'),
                ),
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                ElevatedButton(
                  onPressed: () => addEmployee(context),
                  child: Text('Tambah Pegawai'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: employees.length,
              itemBuilder: (context, index) {
                final employee = employees[index];
                return ListTile(
                  title: Text(employee.name),
                  subtitle: Text('Nomor BP: ${employee.employeeId}\nNomor HP: ${employee.phoneNumber}\nEmail: ${employee.email}\nTanggal Input: ${employee.inputDate}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}