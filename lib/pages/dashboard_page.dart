import 'package:flutter/material.dart';
import 'package:institute_unified_complaint_system/utils/routes.dart';

class DashboardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to the Dashboard!',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to the Home Page
                Navigator.pushReplacementNamed(context, MyRoutes.homeRoute);
              },
              child: Text('Go to Home Page'),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // Add your additional feature here
                // For example, you can navigate to a complaints list or create a new complaint.
              },
              child: Text('Additional Feature'),
            ),
            // Add more buttons and features as needed
          ],
        ),
      ),
    );
  }
}
