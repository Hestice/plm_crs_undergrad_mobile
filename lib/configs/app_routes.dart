import 'package:go_router/go_router.dart';
import 'package:crs_undergrad/screens/login_screen.dart';
import 'package:crs_undergrad/screens/landing_screen.dart';

var router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => LandingScreen(),
    ),
    // GoRoute(
    //   path: '/home',
    //   // home screen route here
    // ),
  ],
);
