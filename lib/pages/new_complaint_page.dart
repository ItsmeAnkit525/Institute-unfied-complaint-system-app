import 'package:flutter/material.dart';
import 'complaint.dart';

class NewComplaintPage extends StatefulWidget {
  final void Function(Complaint) onAddComplaint;

  NewComplaintPage({required this.onAddComplaint});

  @override
  _NewComplaintPageState createState() => _NewComplaintPageState();
}

class _NewComplaintPageState extends State<NewComplaintPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final TextEditingController userIdController = TextEditingController();

  final GlobalKey<ScaffoldMessengerState> _scaffoldKey =
      GlobalKey<ScaffoldMessengerState>();

  bool _isSubmitting = false; // Track whether submission is in progress
  bool _isSubmitted = false; // Track whether the complaint is submitted successfully

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Write a New Feedback'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Please provide details of your feedback:',
                style: TextStyle(fontSize: 24),
              ),
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 5,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: categoryController,
                decoration: InputDecoration(labelText: 'Category'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a category';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: userIdController,
                decoration: InputDecoration(labelText: 'User ID'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your user ID';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              _isSubmitting
                  ? CircularProgressIndicator() // Display a circular progress indicator while submitting
                  : ElevatedButton(
                      onPressed: () {
                        if (_validateForm()) {
                          setState(() {
                            _isSubmitting = true; // Start submitting
                          });

                          // Create a new complaint based on user input
                          Complaint newComplaint = Complaint(
                            title: titleController.text,
                            description: descriptionController.text,
                            category: categoryController.text,
                            userId: userIdController.text,
                          );

                          // Simulate a delay to mimic submission
                          Future.delayed(Duration(seconds: 2), () {
                            setState(() {
                              _isSubmitting = false; // End submitting
                              _isSubmitted = true; // Mark as submitted
                            });

                            // Call the callback to add the complaint
                            widget.onAddComplaint(newComplaint);

                            // Clear the text fields
                            titleController.clear();
                            descriptionController.clear();
                            categoryController.clear();
                            userIdController.clear();

                            // Show a confirmation message
                            _showConfirmationMessage();
                          });
                        }
                      },
                      child: _isSubmitted
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Complaint Filed Successfully'),
                                Icon(Icons.check), // Display a tick icon
                              ],
                            )
                          : Text('Submit Complaint'),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  bool _validateForm() {
    // You can add more validation logic here if needed
    return true;
  }

  void _showConfirmationMessage() {
    _scaffoldKey.currentState?.showSnackBar(
      SnackBar(
        content: Text('Complaint filed successfully'),
      ),
    );
  }
}

