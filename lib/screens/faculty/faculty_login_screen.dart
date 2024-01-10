import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:crs_undergrad/common/text_field_common.dart';
import 'package:crs_undergrad/helpers/validator_helper.dart';

class FacultyLoginScreen extends StatefulWidget {
  const FacultyLoginScreen({Key? key}) : super(key: key);

  @override
  _FacultyLoginScreenState createState() => _FacultyLoginScreenState();
}

class _FacultyLoginScreenState extends State<FacultyLoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/faculty_login_screen.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            height: 360,
            width: 280,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(11),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Column(
                        children: [
                          const SizedBox(height: 30),
                          Image.asset(
                            'assets/images/plm_logo.png',
                            height: 89,
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Pamantasan ng Lungsod ng Maynila',
                            style:
                                TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 12),
                          ),
                          const Text(
                            'Computerized Registration System',
                            style:
                                TextStyle(color: Color(0xFF424242), fontSize: 12),
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                    // Text field for username/email
                    TextFieldCommon(
                      controller: emailController,
                      hintText: 'Username/Email',
                      obscureText: false,
                      validator: emailValidator,
                    ),
                    SizedBox(height: 16.0),

                    // Text field for password
                    TextFieldCommon(
                      controller: passwordController,
                      hintText: 'Password',
                      obscureText: true,
                      validator: passwordValidator,
                    ),
                    SizedBox(height: 16.0),
                    // Forgot password
                    GestureDetector(
                      onTap: () {
                        print('Forgot Password? Clicked');
                      },
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.grey.shade800),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    // Login button
                    ElevatedButton(
                      onPressed: () {
                        // Before navigating, ensure that the form is valid
                        if (_formKey.currentState?.validate() ?? false) {
                          // If the form is valid, navigate to the faculty dashboard
                          GoRouter.of(context).go('/faculty-dashboard');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue, // Visible color against white background
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4.0), // Consistent with Material Design
                        ),
                        minimumSize: Size(double.infinity, 50), // Ensures the button is tall enough
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
