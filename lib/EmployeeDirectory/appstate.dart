import 'package:flutter/material.dart';
import 'company.dart';
import 'package:miniproject/EmployeeDirectory/employee.dart';

class AppState extends ChangeNotifier {
  List<Company> _companies = [
    Company(
      name: 'PT ABC',
      employees: [
        Employee(name: 'Reza', position: 'Ceo'),
        Employee(name: 'Roni', position: 'Developer'),
      ],
    ),
    Company(
      name: 'Indo Surya',
      employees: [
        Employee(name: 'Roy', position: 'CEO'),
        Employee(name: 'Budi', position: 'Manager'),
        Employee(name: 'Eri', position: 'Developer'),
      ],
    ),
    Company(
      name: 'PT Huraisin',
      employees: [
        Employee(name: 'Andre', position: 'Ceo'),
        Employee(name: 'Alfino', position: 'Developer'),
      ],
    ),
    Company(
      name: 'Osmaraldo',
      employees: [
        Employee(name: 'Boy', position: 'CEO'),
        Employee(name: 'Alfino', position: 'Manager'),
        Employee(name: 'Doni', position: 'Developer'),
      ],
    ),
    Company(
      name: 'Sedia Nusa',
      employees: [
        Employee(name: 'Kurniawan ', position: 'CEO'),
        Employee(name: 'Rani', position: 'Manager'),
        Employee(name: 'Retno', position: 'Developer'),
      ],
    ),
  ];

  List<Company> get companies => _companies;

  void addCompany(Company company) {
    _companies.add(company);
    notifyListeners();
  }
}