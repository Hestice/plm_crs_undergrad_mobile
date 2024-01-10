import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ViewAssignmentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View Assignments'),
      ),
      body: Column(
        children: [
          // Your header area might include additional details like user info and date
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: '2024',
                suffixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          // Status filter chips
          Wrap(
            spacing: 8.0,
            children: [
              Chip(
                label: const Text('CP'),
                backgroundColor: Colors.blue.shade100,
              ),
              Chip(
                label: const Text('NC'),
                backgroundColor: Colors.orange.shade100,
              ),
              // Add more chips for different statuses
            ],
          ),
          // Use GridView.builder for a grid layout of assignments
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 2 / 3,
              ),
              itemCount: 6, // Number of assignment cards
              itemBuilder: (context, index) {
                // Replace with your assignment data
                return AssignmentCard(
                  title: '2023 - CSE 101-1 - PRACTICUM',
                  status: 'CP', // or 'NC' based on the assignment status
                );
              },
            ),
          ),
          // Bottom navigation with 'Back' and 'Log Out' buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => context.go('/faculty-dashboard'), // Navigate to home/dashboard
                style: ElevatedButton.styleFrom(primary: Colors.red),
                child: const Text('Back'),
              ),
              ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).go('/login');
                },
                style: ElevatedButton.styleFrom(primary: Colors.red),
                child: const Text('Log Out'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AssignmentCard extends StatelessWidget {
  final String title;
  final String status;

  const AssignmentCard({
    Key? key,
    required this.title,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: status == 'CP' ? Colors.blue.shade100 : Colors.orange.shade100,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(8.0),
        child: Text(title),
      ),
    );
  }
}
