import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      GoRouter.of(context).go('/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/mainscreen_bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Stack(
            children: [
              // Centered image
              Center(
                child: Image.asset(
                  'assets/images/plm_logo.png',
                ),
              ),
              // Your other widgets can be added to the Stack if needed
            ],
          ),
        ),
      ),
    );
  }
}
