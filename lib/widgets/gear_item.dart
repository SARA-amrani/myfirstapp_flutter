import 'package:flutter/material.dart';

class GearItem extends StatelessWidget {
  final String title;
  final String? status;
  final String? note;

  GearItem({
    required this.title,
    this.status,
    this.note,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
      child: ListTile(
        leading: Icon(Icons.settings),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (status != null && status!.isNotEmpty)
              Text('Status: $status'),
            if (note != null && note!.isNotEmpty)
              Text('Note: $note'),
          ],
        ),
      ),
    );
  }
}
