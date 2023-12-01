import 'package:flutter/material.dart';
import 'package:institute_unified_complaint_system/pages/complaint.dart';
import 'package:institute_unified_complaint_system/pages/complaints_provider.dart';
import 'package:institute_unified_complaint_system/pages/home_page.dart';
import 'package:institute_unified_complaint_system/pages/login_page.dart';
import 'package:institute_unified_complaint_system/pages/dashboard_page.dart';
import 'package:institute_unified_complaint_system/utils/routes.dart';
import 'package:institute_unified_complaint_system/utils/widgets/themes.dart';
import 'package:provider/provider.dart';
import 'package:institute_unified_complaint_system/pages/complaints_list_page.dart'
    as ComplaintsListPage;
import 'package:institute_unified_complaint_system/pages/new_complaint_page.dart'
    as NewComplaintPage;

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ComplaintsProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.loginRoute,
      routes: {
        "/": (context) => LoginPage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.dashboardRoute: (context) => DashboardPage(),
        MyRoutes.newComplaintRoute: (context) =>
            NewComplaintPage.NewComplaintPage(
              onAddComplaint: (Complaint newComplaint) {
                // Use Provider to access the ComplaintsProvider
                final complaintsProvider =
                    Provider.of<ComplaintsProvider>(context, listen: false);

                // Add the new complaint to the list
                complaintsProvider.addComplaint(newComplaint);
              },
            ),
        MyRoutes.complaintsListRoute: (context) =>
            ComplaintsListPage.ComplaintListPage(
              complaints: Provider.of<ComplaintsProvider>(context).complaints,
              onDelete: (Complaint complaint) {
                // Use Provider to access the ComplaintsProvider
                final complaintsProvider =
                    Provider.of<ComplaintsProvider>(context, listen: false);

                // Delete the complaint from the list
                complaintsProvider.deleteComplaint(complaint);
              },
            ),
      },
    );
  }
}
