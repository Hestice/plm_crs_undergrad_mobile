import 'package:flutter/material.dart';

class AssignmentDetailScreen extends StatelessWidget {
  final String id;

  const AssignmentDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Use the id to fetch or display the assignment details
    return Scaffold(
      appBar: AppBar(
        title: Text('Assignment Details for ID: $id'),
      ),
      body: Center(
        child: Text('Displaying details for assignment ID: $id'),
      ),
    );
  }
}