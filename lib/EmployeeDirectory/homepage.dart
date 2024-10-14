import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:miniproject/EmployeeDirectory/appstate.dart';
import 'package:miniproject/EmployeeDirectory/companypage.dart';
import 'package:miniproject/EmployeeDirectory/addcompanydialog.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(title: Text('Companies')),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: appState.companies.map((company) {
          return Card(
            color: Colors.white,
            elevation: 2,
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CompanyPage(company: company)),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.business_sharp, size: 50),
                  SizedBox(height: 10),
                  Text(
                    company.name,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 5),
                  Text(
                    '${company.employees.length} employees',
                    style: TextStyle(fontSize: 12),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
      floatingActionButton: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) => AddCompanyDialog(),
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
                'Tambah Perusahaan'
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}










