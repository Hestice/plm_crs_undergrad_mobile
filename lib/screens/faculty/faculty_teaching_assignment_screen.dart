import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TeachingAssignment extends StatelessWidget {
  const TeachingAssignment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Dummy data for the table
    final assignments = List.generate(
      6,
          (index) => {'status': 'CP', 'code': '2023 - CSE 101-1 - PRACTICUM', 'id': index.toString()},
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
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 3 / 2,
              ),
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
                    code: assignment['code']!,
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
                  child: GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 3 / 2,
                    ),
                    itemCount: assignments.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          // When a card is tapped, navigate to the detail screen
                          GoRouter.of(context).go('/assignment-detail');
                        },
                        child: AssignmentCard(
                          status: assignments[index]['status']!,
                          code: assignments[index]['code']!,
                        ),
                      );
                    },
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
  final String code;

  const AssignmentCard({
    Key? key,
    required this.status,
    required this.code,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color = status == 'CP' ? Colors.blue : Colors.orange; // Choose color based on status

    return Card(
      color: color,
      child: GridTile(
        header: GridTileBar(
          title: Text(status, style: const TextStyle(color: Colors.white)),
          backgroundColor: color.withOpacity(0.7),
        ),
        child: Center(
          child: Text(
            code,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}


