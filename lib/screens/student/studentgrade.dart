import 'package:flutter/material.dart';

class StudentGrade extends StatefulWidget {
  const StudentGrade({Key? key}) : super(key: key);

  @override
  State<StudentGrade> createState() => _StudentGradeState();
}

class _StudentGradeState extends State<StudentGrade> {
  String selectedOption = '2024'; // default option

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            alignment: Alignment.bottomCenter,
            height: 170,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Student Grades",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "Gabriel Nicoh Barrios",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      "gnhbarrios2020@plm.edu.ph",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(5.0),
                  margin: const EdgeInsets.only(left: 80.0, top: 40.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.red, // Set the border color
                      width: 2.0, // Set the border width
                    ),
                    borderRadius:
                        BorderRadius.circular(8.0), // Set the border radius
                  ),
                  child: const Text(
                    "202010391",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 150, // Set the desired width
            child: DropdownButton<String>(
              value: selectedOption,
              onChanged: (String? newValue) {
                setState(() {
                  selectedOption = newValue!;
                });
              },
              icon: const Icon(Icons.arrow_drop_down), // Set the dropdown icon
              iconSize: 24, // Adjust the icon size as needed
              isExpanded: true,
              items: <String>['2024', '2025', '2026', '2027']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Text(value),
                  ),
                );
              }).toList(),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
                horizontal: 40), // Adjust the horizontal margin as needed
            child: Table(
              border: TableBorder.all(color: Colors.black),
              children: const [
                TableRow(
                  children: [
                    TableCell(
                        child: Center(child: Text('Subject Code - Section'))),
                    TableCell(child: Center(child: Text('Subject Grade'))),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Center(child: Text('CSE1-2'))),
                    TableCell(child: Center(child: Text('lorem epsum blabla'))),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Center(child: Text('CSE1-2'))),
                    TableCell(child: Center(child: Text('lorem epsum blabla'))),
                  ],
                ),
                TableRow(
                  children: [
                    TableCell(child: Center(child: Text('CSE1-2'))),
                    TableCell(child: Center(child: Text('lorem epsum blabla'))),
                  ],
                ),
                // Add more TableRow widgets for additional rows as needed
              ],
            ),
          ),
          Spacer(),
          Spacer(),
          Spacer(),
          Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Adjust alignment as needed
            children: [
              const SizedBox(
                  height:
                      1), // Adding some space between existing content and buttons
              ElevatedButton(
                onPressed: () {
                  // Add your button 1 action here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text(
                    "Print SER",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 8), // Adding some space between buttons
              ElevatedButton(
                onPressed: () {
                  // Add your button 2 action here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text(
                    "Log Out",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white, // Set button background color
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(8.0), // Set button border radius
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text(
                    "Home",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.yellowAccent, // Set button background color
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(8.0), // Set button border radius
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Text(
                    "Grades",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }
}
