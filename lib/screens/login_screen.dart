import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:crs_undergrad/common/text_field_common.dart';
import 'package:crs_undergrad/helpers/validator_helper.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/mainscreen_bg.png'),
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
                    const SizedBox(height: 35),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/plm_logo.png',
                            height: 200,
                          ),
                          const Text(
                            'Pamantasan ng Lungsod ng Maynila',
                            style:
                                TextStyle(color: Color(0xFF424242), fontSize: 16),
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
                        GoRouter.of(context).go('/home');
                        // Implement login button functionality here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFC83B), // Corrected color code
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1.0),
                        ),
                        minimumSize: Size(double.infinity, 0),
                      ),
                      child: Text(
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
