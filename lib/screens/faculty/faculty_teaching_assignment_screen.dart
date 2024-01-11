import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TeachingAssignment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Dummy data for the table
    final assignments = [
      {'status': 'Pending', 'code': 'CSE 12-2'},
      {'status': 'Pending', 'code': 'CSE 13-2-3'},
      {'status': 'Pending', 'code': 'Elective 3-2'},
      {'status': 'Pending', 'code': 'CSE 12-1'},
      {'status': 'Pending', 'code': 'CSE 13-2-1'},
      {'status': 'Pending', 'code': 'Elective 3-1'},
      // Add more assignments here...
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Teaching Assignment'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: '2024',
                suffixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('Subject Status')),
                  DataColumn(label: Text('Subject Code - Section')),
                ],
                rows: List<DataRow>.generate(
                  assignments.length,
                  (index) => DataRow(
                    cells: [
                      DataCell(Chip(
                        label: Text(assignments[index]['status']!),
                        backgroundColor: Colors.blue.shade100,
                      )),
                      DataCell(Text(assignments[index]['code']!)),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Use GoRouter to navigate back to the dashboard screen
                      GoRouter.of(context).go('faculty-dashboard');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text('Back',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Implement log out functionality
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'Log Out',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
