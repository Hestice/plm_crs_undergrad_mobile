import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:crs_undergrad/common/text_field_common.dart';
import 'package:crs_undergrad/helpers/validator_helper.dart';
import 'package:crs_undergrad/common/button_common.dart';

class FacultyLoginScreen extends StatefulWidget {
  const FacultyLoginScreen({Key? key}) : super(key: key);

  @override
  _FacultyLoginScreenState createState() => _FacultyLoginScreenState();
}

class _FacultyLoginScreenState extends State<FacultyLoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController SSOCodeController = TextEditingController();

  bool showEmailAndPasswordFields = false;

  void _toggleEmailPasswordFields() {
    setState(() {
      showEmailAndPasswordFields = !showEmailAndPasswordFields;
    });
  }

  Future<void> _loginWithEmailPassword() async {
    print("Login function called"); // Debug print

    // Early return if form is not valid
    if (!(_formKey.currentState?.validate() ?? false)) {
      print('Form validation failed');
      return;
    }

    // Hardcoded dummy credentials
    const String dummyEmail = 'facultyplm@gmail.com';
    const String dummyPassword = 'faculty123';

    // Get the input values
    String inputEmail = emailController.text;
    String inputPassword = passwordController.text;

    // Check if the input credentials match the dummy credentials
    if (inputEmail == dummyEmail && inputPassword == dummyPassword) {
      // Navigate to the home screen after successful login
      _navigateToHome();
    } else {
      // Handle login failure (e.g., show an alert dialog or a snackbar)
      print('Login failed: Incorrect email or password');
      // Consider displaying a user-friendly error message
    }
  }

  void _navigateToHome() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        GoRouter.of(context).go('/faculty-dashboard');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double containerHeight = showEmailAndPasswordFields ? 460.0 : 390.0; // Adjust container height
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/faculty_login_screen_bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            height: containerHeight,
            width: 280,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(11),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Top content with image and texts
                      Image.asset('assets/images/plm_logo.png', height: 89),
                      const SizedBox(height: 10),
                      const Text('Pamantasan ng Lungsod ng Maynila', style: TextStyle(fontSize: 12)),
                      const Text('Computerized Registration System', style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic)),
                      const SizedBox(height: 30),

                      // Toggle Email and Password Fields
                      ButtonCommon(
                        onPressFunctionName: _toggleEmailPasswordFields,
                        bgColorOpacity: 255,
                        bgColorHex: Colors.white.value,
                        buttonText: 'Login with Email',
                        textColorHex: Colors.black.value,
                        iconPath: 'assets/icons/key_icon.png',
                        buttonBorder: BorderSide(color: Colors.black, width: 1),
                      ),
                      const SizedBox(height: 12.0),

                      // Email and Password Fields
                      if (showEmailAndPasswordFields) ...[
                        TextFieldCommon(
                          controller: emailController,
                          hintText: 'Email',
                          obscureText: false,
                          validator: (value) => (value != null && value.isEmpty) ? 'Enter email' : null,
                        ),
                        const SizedBox(height: 12.0),
                        TextFieldCommon(
                          controller: passwordController,
                          hintText: 'Password',
                          obscureText: true,
                          validator: (value) => (value != null && value.isEmpty) ? 'Enter password' : null,
                        ),
                        const SizedBox(height: 24.0),
                        ElevatedButton(
                          onPressed: _loginWithEmailPassword,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                          ),
                          child: const Text('Login', style: TextStyle(color: Colors.white)),
                        ),
                      ],

                      // Other buttons and functionalities
                      ButtonCommon(
                        onPressFunctionName: () => GoRouter.of(context).go('/student-login'),
                        bgColorOpacity: 255,
                        bgColorHex: Colors.white.value,
                        buttonText: 'Sign in With Microsoft Account',
                        textColorHex: Colors.black.value,
                        iconPath: 'assets/icons/microsoft_icon.png',
                        buttonBorder: BorderSide(color: Colors.black, width: 1),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
