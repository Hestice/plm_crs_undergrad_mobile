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
    return 
    Container(
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
              Positioned(
                top: 10,
                left: 5,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF4890D2),
                    shape: CircleBorder(),
                  ),
                  onPressed: () {
                    GoRouter.of(context).go('/');
                    print('Back Button Clicked');
                  },
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                    decoration: const BoxDecoration(
                    color: Colors.transparent, 
                  ),
                  child: Flexible(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 20, 140),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Column(
                                children: [
                                  const SizedBox(height: 35),
                                  Image.asset(
                                    'assets/images/plm_logo.png',
                                    height: 200,
                                  ),
                                  const Text(
                                    'Pamantasan ng Lungsod ng Maynila',
                                    style: TextStyle(color: Color(0xFF424242), fontSize: 16),
                                  ),
                                  const SizedBox(height: 30),
                                ],
                              ),
                            ),
                            //Text field for username/email
                            TextFieldCommon(
                                controller: emailController,
                                hintText: 'Username/Email',
                                obscureText: false,
                                validator: emailValidator,
                              ),
                            SizedBox(height: 16.0),

                            //Text field for password 
                            TextFieldCommon(
                                controller: passwordController,
                                hintText: 'Password',
                                obscureText: true,
                                validator: passwordValidator,
                              ),
                            SizedBox(height: 16.0),

                            //forgot password
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
                            
                            //Login button
                            ElevatedButton(
                              onPressed: () {
                                GoRouter.of(context).go('/terms_and_conditions_screen');
                                // Implement login button functionality here
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                Color.fromARGB(255, 255, 125, 81),
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
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                padding: const EdgeInsets.only(bottom: 100.0),
                child: Text(
                  "Don't have an account yet?",
                  style: TextStyle(
                    color: Colors.white,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print('Create an account? Clicked');
                  GoRouter.of(context).go('/create_account_screen');

                },
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                  padding: const EdgeInsets.only(bottom: 80.0),
                  child: Text(
                    'Create An Account',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white,
                      color: Colors.white
                    ),
                  ),
                  ),
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}
