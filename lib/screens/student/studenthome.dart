import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Item {
  Item({
    required this.headerText,
    required this.expandedText,
    this.isExpanded = false,
  });

  String headerText;
  String expandedText;
  bool isExpanded;
}

class StudentHome extends StatefulWidget {
  const StudentHome({Key? key}) : super(key: key);

  @override
  State<StudentHome> createState() => _StudentHomeState();
}

class _StudentHomeState extends State<StudentHome> {
  String selectedOption = '2024'; // default option
  late List<Item> _data;

  @override
  void initState() {
    super.initState();
    _data = List<Item>.generate(4, (int index) {
      return Item(
        headerText: 'Step $index:',
        expandedText: _getDescriptionForStep(index),
      );
    });
  }

  String _getDescriptionForStep(int index) {
    switch (index) {
      case 0:
        return 'Welcome to the student home page! View your enrolled courses and grades.';
      case 1:
        return 'Explore upcoming events and announcements related to your courses.';
      case 2:
        return 'Track your academic progress and achievements.';
      case 3:
        return 'Connect with your peers and instructors for a collaborative learning experience.';
      default:
        return 'This is item number $index';
    }
  }


  @override
  Widget build(BuildContext context) {
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
                    "Enrollment",
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
                      "Logged in as Student no.",
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
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
            child: ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  _data[index].isExpanded = !isExpanded;
                });
              },
              children: _data.map<ExpansionPanel>((Item item) {
                return ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(
                      title: Text(
                        item.headerText,
                        style: const TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    );
                  },
                  body: ListTile(
                    title: Text(item.expandedText),
                  ),
                  isExpanded: item.isExpanded,
                );
              }).toList(),
            ),
          ),
          Spacer(),
          Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Adjust alignment as needed
            children: [
              const SizedBox(
                height: 10,
                width: 10,
              ), // Adding some space between existing content and buttons
              
              const SizedBox(height: 8), // Adding some space between buttons
              ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).go('/login');
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
                    "Home",
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).go('/student-grades');
                },
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
