import 'package:flutter/material.dart';
import 'package:myfirstapp_flutter/widgets/gear_item.dart'; // Importation du widget GearItem

class AddGearScreen extends StatefulWidget {
  @override
  _AddGearScreenState createState() => _AddGearScreenState();
}

class _AddGearScreenState extends State<AddGearScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  String _status = 'OK';
  final _faultController = TextEditingController();
  final _rulController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add New Gear')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name of Gear'),
                validator: (value) => value!.isEmpty ? 'Enter name' : null,
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: _status,
                items: ['OK', 'Warning', 'Fault']
                    .map((status) => DropdownMenuItem(value: status, child: Text(status)))
                    .toList(),
                onChanged: (val) => setState(() => _status = val!),
                decoration: InputDecoration(labelText: 'Status'),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _faultController,
                decoration: InputDecoration(labelText: 'Fault Code (optional)'),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _rulController,
                decoration: InputDecoration(labelText: 'Estimated RUL (optional)'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final icon = _status == "OK"
                        ? Icons.check_circle
                        : _status == "Warning"
                            ? Icons.warning_amber_rounded
                            : Icons.error;
                    final iconColor = _status == "OK"
                        ? Colors.green
                        : _status == "Warning"
                            ? Colors.orange
                            : Colors.red;

                    String? note;
                    if (_faultController.text.isNotEmpty) {
                      note = _faultController.text;
                    } else if (_rulController.text.isNotEmpty) {
                      note = "RUL: ${_rulController.text}d";
                    }

                    final newGear = GearItem(
                      title: _nameController.text,
                      status: _status,
                      icon: icon,
                      iconColor: iconColor,
                      note: note,
                    );
                    Navigator.pop(context, newGear);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  minimumSize: Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: Text('Add', style: TextStyle(color: Colors.white, fontSize: 16)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
