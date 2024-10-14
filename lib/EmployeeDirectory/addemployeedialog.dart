import 'package:flutter/material.dart';
import 'package:miniproject/EmployeeDirectory/company.dart';
import 'package:provider/provider.dart';
import 'package:miniproject/EmployeeDirectory/employee.dart';
import 'package:miniproject/EmployeeDirectory/appstate.dart';

class AddEmployeeDialog extends StatefulWidget {
  final Company company;

  AddEmployeeDialog({required this.company});

  @override
  _AddEmployeeDialogState createState() => _AddEmployeeDialogState();
}

class _AddEmployeeDialogState extends State<AddEmployeeDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _positionController = TextEditingController();
  // final _salaryController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _positionController.dispose();
    // _salaryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add Employee'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a name';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _positionController,
              decoration: InputDecoration(labelText: 'Position'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a position';
                }
                return null;
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            final appState = Provider.of<AppState>(context, listen: false);
            if (_formKey.currentState!.validate()) {
              final name = _nameController.text;
              final position = _positionController.text;
              // final salary = double.parse(_salaryController.text);

              final employee = Employee(name: name, position: position);

              widget.company.employees.add(employee);
              appState.notifyListeners();

              Navigator.pop(context);
            }
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}