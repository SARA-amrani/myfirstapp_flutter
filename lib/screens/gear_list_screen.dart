import 'package:flutter/material.dart';
import '../widgets/gear_item.dart';
import 'add_gear_screen.dart';

class GearListScreen extends StatefulWidget {
  @override
  _GearListScreenState createState() => _GearListScreenState();
}

class _GearListScreenState extends State<GearListScreen> {
  List<Map<String, String>> gearList = [];

  void _addNewGear(Map<String, String> gear) {
    setState(() {
      gearList.add(gear);
    });
  }

  void _navigateToAddGearScreen() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddGearScreen(onAddGear: _addNewGear),
      ),
    );
  }

  int _selectedIndex = 0;

  void _onBottomNavTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Gears'),
      ),
      body: ListView.builder(
        itemCount: gearList.length,
        itemBuilder: (context, index) {
          return GearItem(
            title: gearList[index]['title']!,
            status: gearList[index]['status'],
            note: gearList[index]['note'],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToAddGearScreen,
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onBottomNavTap,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Gears'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
