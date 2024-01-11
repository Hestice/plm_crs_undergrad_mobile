import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FacultyDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Faculty Dashboard'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Card(
              margin: const EdgeInsets.all(12.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    // Welcome and User Info Section
                    const Text('Hi! Juan Dela Cruz',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        )),
                    const Text('20202015',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.blue,
                        )),
                    const SizedBox(height: 15.0),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Icon(Icons.school, color: Colors.grey),
                        ),
                        Text(
                          'Faculty of Engineering and Technology\nBS Computer Science',
                          style: Theme
                              .of(context)
                              .textTheme
                              .subtitle1,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),

                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Icon(Icons.calendar_month, color: Colors.grey),
                        ),
                        Text(
                          'School Year 2024 - 2025',
                          style: Theme
                              .of(context)
                              .textTheme
                              .subtitle1,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    // Subject Status
                    Text(
                      'Subject Status: Pending',
                      style: Theme
                          .of(context)
                          .textTheme
                          .subtitle1,
                    ),
                    const Divider(height: 32.0, thickness: 1.2),
                    // List of Actions
                    _buildActionItem(context, 'Teaching Assignment'),
                    _buildActionItem(context, 'View Grades'),
                    _buildActionItem(context, 'View Assignments'),
                    const SizedBox(height: 16.0),
                    // Open Teams Button
                    const SizedBox(height: 16.0),
                    // Academic Calendar Notice
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Container(
              height: 60,
              width: 350,
              decoration: BoxDecoration(
                color: Colors.amber[200],
                borderRadius: BorderRadius.circular(
                    10), // Adjust the radius to get the curve you want
              ),
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Text(
                    'Academic calendar application is pending.\n(A.Y. 2024 - 2025)',
                    style: TextStyle(
                      color: Colors.amber[800],
                    )),
              ),
            ),

            const SizedBox(height: 16.0),
            // Logout Button
            ElevatedButton(
              onPressed: () {
                GoRouter.of(context).go('/login');
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red, // Background color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
              child:
              const Text('Log Out', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Class Directory',
          ),
        ],
        onTap: (index) {
          // Handle navigation tap
        },
      ),
    );
  }

  Widget _buildActionItem(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: OutlinedButton(
        onPressed: () {
          if (title == 'Teaching Assignment') {
            context.go('/teaching-assignment');
          } else if (title == 'View Assignments') {
            context.go('/view-assignments'); // This is the new line you add
          } else if (title == 'View Grades') {
            context.go('/faculty-grades'); // This is the new line you add
          } else {
            // Handle other actions
          }
        },
        child: Text(title),
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Theme
              .of(context)
              .dividerColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
      ),
    );
  }
}