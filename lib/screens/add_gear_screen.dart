import 'package:flutter/material.dart';

class AddGearScreen extends StatefulWidget {
  final Function(Map<String, String>) onAddGear;

  AddGearScreen({required this.onAddGear});

  @override
  _AddGearScreenState createState() => _AddGearScreenState();
}

class _AddGearScreenState extends State<AddGearScreen> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _status = '';
  String _note = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final newGear = {
        'title': _title,
        'status': _status,
        'note': _note,
      };

      widget.onAddGear(newGear);
      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Gear added successfully')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a New Gear'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Gear Title'),
                validator: (value) => value == null || value.isEmpty ? 'Enter title' : null,
                onSaved: (value) => _title = value!,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Status'),
                onSaved: (value) => _status = value ?? '',
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Note'),
                onSaved: (value) => _note = value ?? '',
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Add Gear'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
