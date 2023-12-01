// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:institute_unified_complaint_system/utils/drawer.dart';
import 'package:institute_unified_complaint_system/utils/routes.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: SingleChildScrollView( // Add a SingleChildScrollView to make content scrollable if needed
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/institute_image.png', // Replace with the actual image path
              height: 200, // Adjust the height as needed
              width: 200, // Make the image take up the full width
              fit: BoxFit.cover, // Adjust the fit as needed
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Campus Insights App',
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the Complaints List Page
                      Navigator.pushNamed(context, MyRoutes.complaintsListRoute);
                    },
                    child: Text('View Complaints'),
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to the New Complaint Form Page
                      Navigator.pushNamed(context, MyRoutes.newComplaintRoute);
                    },
                    child: Text('Write a New Feedback'),
                  ),
                  SizedBox(height: 20.0),
                  // Display recent announcements or news related to the institution
                  Text(
                    'Latest Announcements:',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 10.0),
                  // Add a list of recent announcements with titles and dates
                  AnnouncementTile(title: 'Important Update', date: 'Oct 15, 2023'),
                  AnnouncementTile(title: 'New Policy Changes', date: 'Oct 10, 2023'),
                  
                  // Add more announcements as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnnouncementTile extends StatelessWidget {
  final String title;
  final String date;

  AnnouncementTile({required this.title, required this.date});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(date),
      // Add onTap functionality to navigate to a detailed announcement page if needed
    );
  }
}

