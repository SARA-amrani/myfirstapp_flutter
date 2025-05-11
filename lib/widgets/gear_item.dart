import 'package:flutter/material.dart';

class GearItem extends StatelessWidget {
  final String title;
  final String? status;
  final IconData? icon;
  final Color? iconColor;
  final String? note;

  const GearItem({
    required this.title,
    this.status,
    this.icon,
    this.iconColor,
    this.note,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        leading: icon != null
            ? CircleAvatar(
                backgroundColor: iconColor!.withOpacity(0.2),
                child: Icon(icon, color: iconColor),
              )
            : null,
        title: Text(title, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (status != null)
              Container(
                margin: EdgeInsets.only(top: 4),
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: iconColor?.withOpacity(0.1) ?? Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  status!,
                  style: TextStyle(color: iconColor, fontWeight: FontWeight.w500),
                ),
              ),
            if (note != null)
              Padding(
                padding: const EdgeInsets.only(top: 6),
                child: Text(note!, style: TextStyle(color: Colors.grey.shade700)),
              ),
          ],
        ),
      ),
    );
  }
}
