import 'package:flutter/foundation.dart';

import 'complaint.dart';

class ComplaintsProvider extends ChangeNotifier {
  List<Complaint> _complaints = [];

  List<Complaint> get complaints => _complaints;

  void addComplaint(Complaint complaint) {
    _complaints.add(complaint);
    notifyListeners(); // Notify listeners to update the UI
  }

  void deleteComplaint(Complaint complaint) {
    _complaints.remove(complaint);
    notifyListeners(); // Notify listeners to update the UI
  }
}
