import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TeachingAssignment extends StatelessWidget {
  const TeachingAssignment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dummy data for the table
    final assignments = List.generate(
      6,
      (index) => {
        'status': 'CP',
        'section': '2023 - CSE 101-1 - PRACTICUM',
        'id': index.toString(),
      },
    );

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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Status',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Section',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: assignments.length,
              itemBuilder: (context, index) {
                final assignment = assignments[index];
                return GestureDetector(
                  onTap: () {
                    // Navigate to the assignment detail screen with the id as a parameter
                    GoRouter.of(context).go('/assignment-detail/${assignment['id']}');
                  },
                  child: AssignmentCard(
                    status: assignment['status']!,
                    section: assignment['section']!,
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Use GoRouter to navigate back to the dashboard screen
                      GoRouter.of(context).go('/faculty-dashboard');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text('Back', style: TextStyle(color: Colors.white)),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Use GoRouter to navigate back to the dashboard screen
                      GoRouter.of(context).go('/login');
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text('Logout', style: TextStyle(color: Colors.white)),
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

class AssignmentCard extends StatelessWidget {
  final String status;
  final String section;

  const AssignmentCard({
    Key? key,
    required this.status,
    required this.section,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color statusColor = status.toLowerCase() == 'cp' ? Colors.blue : Colors.orange; // Choose color based on status
    String displayStatus = status.toLowerCase() == 'cp' ? 'Pending' : status;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Card(
            color: statusColor,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                displayStatus,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          Text(
            section,
            style: const TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
