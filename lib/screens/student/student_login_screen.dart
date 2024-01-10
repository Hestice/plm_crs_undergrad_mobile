import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:crs_undergrad/common/text_field_common.dart';
import 'package:crs_undergrad/helpers/validator_helper.dart';
import 'package:crs_undergrad/common/button_common.dart';

class StudentLoginScreen extends StatefulWidget {
  const StudentLoginScreen({Key? key}) : super(key: key);

  @override
  _StudentLoginScreenState createState() => _StudentLoginScreenState();
}

class _StudentLoginScreenState extends State<StudentLoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/student_login_screen_bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            height: 390,
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
                            style: TextStyle(
                              color: Color(0xFF424242),
                              fontSize: 12,
                              fontStyle: FontStyle.italic, // Add this line to make the text italic
                            ),
                          ),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                    ButtonCommon(
                      onPressFunctionName: () {
                        print('clicked');
                      },
                      bgColorOpacity: 255,
                      bgColorHex: Colors.white.value,
                      buttonText: 'Login with SSO',
                      textColorHex: Colors.black.value,
                      iconPath: 'assets/icons/key_icon.png',
                      buttonBorder: BorderSide(color: Colors.black, width: 1),
                    ),

                    SizedBox(height: 12.0),
                    
                    ButtonCommon(
                      onPressFunctionName: () {
                        print('clicked');
                      },
                      bgColorOpacity: 255,
                      bgColorHex: Colors.white.value,
                      buttonText: 'Sign in With Microsoft Account',
                      textColorHex: Colors.black.value,
                      iconPath: 'assets/icons/microsoft_icon.png', 
                      buttonBorder: BorderSide(color: Colors.black, width: 1),
                    ),

                    SizedBox(height: 12.0),

                    ButtonCommon(
                      onPressFunctionName: () {
                        GoRouter.of(context).go('/student-login');
                      },
                      bgColorOpacity: 255, // Opacity, ranging from 0 to 255
                      bgColorHex: 0xFFC83B, // Hexadecimal background color
                      buttonText: 'Enroll at PLM',
                      textColorHex: Colors.white.value, 
                      buttonBorder: BorderSide(color: Color(0xFFB36C02), width: 1),
                    ),
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
