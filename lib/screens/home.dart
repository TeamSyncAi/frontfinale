import 'package:flutter/material.dart';
import 'package:teamsyncai/model/dashtask.dart';
import 'package:teamsyncai/screens/plus.dart';
import 'package:teamsyncai/screens/profile.dart';
import 'package:teamsyncai/screens/TasksPage.dart';
import 'package:teamsyncai/screens/task.dart/taskmain.dart';
import 'appbar.dart';

class home extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<home> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 4) {
      Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 500),
          pageBuilder: (_, __, ___) => taskmain(),
          transitionsBuilder: (_, animation, __, child) {
            return SlideTransition(
              position: Tween<Offset>(
                begin: Offset(1.0, 0.0),
                end: Offset.zero,
              ).animate(animation),
              child: child,
            );
          },
        ),
      );
    }
     if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProjectFirst()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('TeamSyncAii'),
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: [],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Profile()),
          );
        },
        child: Icon(Icons.person_remove),
      ),
    );
  }
}
