import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:miniproject/EmployeeDirectory/company.dart';
import 'package:miniproject/EmployeeDirectory/appstate.dart';

class AddCompanyDialog extends StatefulWidget {
  @override
  _AddCompanyDialogState createState() => _AddCompanyDialogState();
}

class _AddCompanyDialogState extends State<AddCompanyDialog> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Tambah Perusahaan'),
      content: Form(
        key: _formKey,
        child: TextFormField(
          controller: _nameController,
          decoration: InputDecoration(labelText: 'Name'),
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please enter a name';
            }
            return null;
          },
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              final name = _nameController.text;
              final company = Company(name: name, employees: []);

              final appState = Provider.of<AppState>(context, listen: false);
              appState.addCompany(company);

              Navigator.pop(context);
            }
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}