import 'package:flutter/material.dart';
import 'complaint.dart';

class ComplaintListPage extends StatefulWidget {
  final List<Complaint> complaints;
  final Function(Complaint) onDelete;

  ComplaintListPage({required this.complaints, required this.onDelete});

  @override
  _ComplaintListState createState() => _ComplaintListState();
}

class _ComplaintListState extends State<ComplaintListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Complaint List'),
      ),
      body: ListView.builder(
        itemCount: widget.complaints.length,
        itemBuilder: (context, index) {
          Complaint complaint = widget.complaints[index];
          return ListTile(
            title: Text(complaint.title),
            subtitle: Text(complaint.description),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // Call the onDelete callback when the delete button is pressed
                widget.onDelete(complaint);
              },
            ),
          );
        },
      ),
    );
  }
}
