import 'package:flutter/material.dart';
import 'add_gear_screen.dart'; // Importation de la page AddGearScreen
import 'package:myfirstapp_flutter/widgets/gear_item.dart'; // Importation du widget GearItem

class GearListScreen extends StatefulWidget {
  @override
  _GearListScreenState createState() => _GearListScreenState();
}

class _GearListScreenState extends State<GearListScreen> {
  List<GearItem> gears = [
    GearItem(title: "Gear 1", status: "OK", icon: Icons.check_circle, iconColor: Colors.green, note: "All Good"),
    GearItem(title: "Gear 2", status: "Warning", icon: Icons.warning_amber_rounded, iconColor: Colors.orange, note: "Fault Code 04"),
    GearItem(title: "Gear 3", status: "Fault", icon: Icons.error, iconColor: Colors.red, note: "Critical"),
    GearItem(title: "Gear 4", note: "RUL 15d"),
    GearItem(title: "Gear 5", note: "Pu6L1"),
  ];

  void _addGear(GearItem gear) {
    setState(() {
      gears.add(gear);
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${gear.title} added successfully!', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F6FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('List of Gears', style: TextStyle(color: Colors.black, fontSize: 26, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.sort, color: Colors.blue)),
          IconButton(onPressed: () {}, icon: Icon(Icons.filter_alt_outlined, color: Colors.blue)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: gears.length,
                itemBuilder: (context, index) => gears[index],
              ),
            ),
            SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: () async {
                final newGear = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddGearScreen()),
                );
                if (newGear != null) {
                  _addGear(newGear);
                }
              },
              icon: Icon(Icons.add_circle, color: Colors.blue),
              label: Text("Add Gear", style: TextStyle(color: Colors.blue)),
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.blue.shade300),
                minimumSize: Size(double.infinity, 48),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: "Overview"),
          BottomNavigationBarItem(icon: Icon(Icons.settings_input_component), label: "Gears"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Alerts"),
          BottomNavigationBarItem(icon: Icon(Icons.analytics), label: "Predictions"),
        ],
      ),
    );
  }
}
