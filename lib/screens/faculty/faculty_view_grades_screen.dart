import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FacultyGrade extends StatefulWidget {
  const FacultyGrade({Key? key}) : super(key: key);

  @override
  State<FacultyGrade> createState() => _FacultyGradeState();
}

class _FacultyGradeState extends State<FacultyGrade> {


  @override
  Widget build(BuildContext context) {
final assignments = [
      {'title': 'Lorem Ipsum', 'code': 'CSE 12-2'},
      {'title': 'Lorem Ipsum', 'code': 'CSE 13-2-3'},
      {'title': 'Lorem Ipsum', 'code': 'Elective 3-2'},
      {'title': 'Lorem Ipsum', 'code': 'CSE 12-1'},
      {'title': 'Lorem Ipsum', 'code': 'CSE 13-2-1'},
      {'title': 'Lorem Ipsum', 'code': 'Elective 3-1'},
      // Add more assignments here...
    ];

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 25),
            alignment: Alignment.bottomCenter,
            height: 170,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(5.0),
                  margin: const EdgeInsets.only(left: 0, top: 5),
                  child: const Text(
                    "Student Grades",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Logged in as Faculty no.",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.red,
                      ),
                    ),
                    Text(
                      "202010391",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Today is Wednesday,",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.green,
                      ),
                    ),
                    Text(
                      "January 10, 2024",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
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
                  DataColumn(label: Text('')),
                  DataColumn(label: Text('Code - Section')),
                  DataColumn(label: Text('Subject Title')),
                ],
                rows: List<DataRow>.generate(
                  assignments.length,
                  (index) => DataRow(
                    cells: [
                      DataCell(
                        Container(
                          width: 10, // Set a fixed width for the edit icon
                          child: IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              // Handle edit action here
                              print('Edit tapped for ${assignments[index]['code']}');
                            },
                          ),
                        ),
                      ),
                      DataCell(Text(assignments[index]['code']!)),
                      DataCell((Text(assignments[index]['title']!))),
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
                      GoRouter.of(context).go('/faculty-dashboard');
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
                      GoRouter.of(context).go('/login');
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
