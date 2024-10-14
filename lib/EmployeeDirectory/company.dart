import 'package:flutter/material.dart';
import 'package:miniproject/EmployeeDirectory/employee.dart';

class Company {
  final String name;
  final List<Employee> employees;

  Company({required this.name, required this.employees});
}