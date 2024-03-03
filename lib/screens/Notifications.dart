import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  @override
  _NotifsState createState() => _NotifsState();
}

class _NotifsState extends State<Notifications>{
bool _pushNotifications = true; // Initial state for push notifications
  bool _emailNotifications = false; // Initial state for email notifications
  bool _locationServices = false; // Initial state for location services

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Settings'),
        backgroundColor: Colors.orange,
          elevation: 15, 
          iconTheme: const IconThemeData(color: Colors.black38),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const Text(
                  'Choose what notifications you want to receive below and we will update the settings.',
                  style: TextStyle(fontSize: 16.0),
                ),
                SizedBox(height: 20.0),
                SwitchListTile(
                  title: const Text('Push Notifications'),
                  subtitle: Text(
                      'Receive occasional push notifications from our application.'),
                  value: _pushNotifications,
                  onChanged: (value) => setState(() => _pushNotifications = value),
                ),
                SwitchListTile(
                  title: const Text('Phone Notifications'),
                  subtitle: const Text(
                      'Receive email notifications from our marketing team about new features.'),
                  value: _emailNotifications,
                  onChanged: (value) => setState(() => _emailNotifications = value),
                ),
                SwitchListTile(
                  title: const Text('Location Services'),
                  subtitle: const Text(
                      'Allow us to track your location to keep track of spending and keep you safe (optional).'),
                  value: _locationServices,
                  onChanged: (value) => setState(() => _locationServices = value),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
} 