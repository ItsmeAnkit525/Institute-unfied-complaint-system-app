// import 'package:flutter/material.dart';

// class ComposePage extends StatefulWidget {
//   @override
//   _ComposePageState createState() => _ComposePageState();
// }

// class _ComposePageState extends State<ComposePage> {
//   final _formKey = GlobalKey<FormState>();
//   TextEditingController _complaintController = TextEditingController();
//   // Other controllers for attaching images

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Compose Complaint'),
//       ),
//       body: Form(
//         key: _formKey,
//         child: Column(
//           children: [
//             TextFormField(
//               controller: _complaintController,
//               decoration: InputDecoration(labelText: 'Complaint'),
//               validator: (value) {
//                 if (value!.isEmpty) {
//                   return 'Please enter a complaint';
//                 }
//                 return null;
//               },
//             ),
//             // Add widgets for attaching images here
//             ElevatedButton(
//               onPressed: () {
//                 if (_formKey.currentState.validate()) {
//                   // Add logic to submit complaint to Firestore and Firebase Storage here
//                 }
//               },
//               child: Text('Submit Complaint'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class ComplaintDialog extends StatelessWidget {
//   final String complaintText;
//   final List<String> attachedImages;

//   // ignore: prefer_const_constructors_in_immutables
//   ComplaintDialog({this.complaintText, this.attachedImages});

//   // Implement the UI for Complaint Dialog based on user roles

//   @override
//   Widget build(BuildContext context) {
//     // Add UI for displaying complaint text and attached images
//   }
// }
