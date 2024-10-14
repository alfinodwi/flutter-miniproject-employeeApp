import 'package:flutter/material.dart';
import 'package:miniproject/EmployeeDirectory/company.dart';
import 'package:provider/provider.dart';
import 'package:miniproject/EmployeeDirectory/appstate.dart';
import 'package:miniproject/EmployeeDirectory/addemployeedialog.dart';

class CompanyPage extends StatelessWidget {
  final Company company;

  CompanyPage({required this.company});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(title: Text(company.name)),
      body: ListView.builder(

        itemCount: company.employees.length,
        itemBuilder: (context, index) {
          final employee = company.employees[index];
          return Card (
            child: ListTile(
              title: Text(employee.name),
              subtitle: Text('${employee.position}'),
            ),
          );
        },
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => AddEmployeeDialog(company: company),
          );
        },
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 100),
            child: Text(
                'Tambah Karyawan'
            ),
          ),
        ),
      ),
    );
  }
}