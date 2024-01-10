import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:crs_undergrad/screens/login_screen.dart';
import 'package:crs_undergrad/screens/faculty/faculty_login_screen.dart';
import 'package:crs_undergrad/screens/student/student_login_screen.dart';
import 'package:crs_undergrad/screens/landing_screen.dart';
import 'package:crs_undergrad/screens/student/studenthome.dart';

import '../screens/faculty/faculty_assignment_detail_screen.dart';
import '../screens/faculty/faculty_assignments_screen.dart';
import '../screens/faculty/faculty_dashboard_screen.dart';
import '../screens/faculty/faculty_teaching_assignment_screen.dart';

var router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => LandingScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/student-login',
      builder: (context, state) => StudentLoginScreen(),
    ),
    GoRoute(
      path: '/faculty-login',
      builder: (context, state) => FacultyLoginScreen(),
    ),
    GoRoute(
      path: '/faculty-dashboard',
      builder: (context, state) => FacultyDashboard(),
    ),
    GoRoute(
      path: '/teaching-assignment',
      builder: (context, state) => TeachingAssignment(),
    ),
    GoRoute(
      path: '/view-assignments',
      builder: (context, state) => ViewAssignmentsScreen(),
    ),
    GoRoute(
      path: '/assignment-detail',
      builder: (context, state) => AssignmentDetailScreen(id: '',),
    ),
     GoRoute(
      path: '/student-home',
      builder: (context, state) => StudentHome(),
    ),
    // GoRoute(
    //   path: '/faculty-home',
    //   builder: (context, state) => FacultyHome(),
    // ),
  ],
);
