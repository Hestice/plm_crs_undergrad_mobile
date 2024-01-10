import 'package:go_router/go_router.dart';
import 'package:crs_undergrad/screens/login_screen.dart';
import 'package:crs_undergrad/screens/faculty/faculty_login_screen.dart';
import 'package:crs_undergrad/screens/student/student_login_screen.dart';
import 'package:crs_undergrad/screens/landing_screen.dart';

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
  ],
);
