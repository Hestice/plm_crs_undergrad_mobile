import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:crs_undergrad/common/text_field_common.dart';
import 'package:crs_undergrad/helpers/validator_helper.dart';
import 'package:crs_undergrad/common/button_common.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

void _testfunction() {
    
    print('Clicked'); 
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
                    SizedBox(height: 12.0),
                    
                    ButtonCommon(
                      onPressFunctionName: () {
                        GoRouter.of(context).go('/student-login');
                      },
                      bgColorOpacity: 255, // Opacity, ranging from 0 to 255
                      bgColorHex: 0xFFC83B, // Hexadecimal background color
                      buttonText: 'Student Account',
                      textColorHex: Colors.white.value, 
                      buttonBorder: BorderSide(color: Color(0xFFF1B418), width: 1),
                    ),

                    SizedBox(height: 10.0),
                    
                    ButtonCommon(
                      onPressFunctionName: () {
                        GoRouter.of(context).go('/faculty-login');
                      },
                      bgColorOpacity: 255, // Opacity, ranging from 0 to 255
                      bgColorHex: 0x3E8AD0, // Hexadecimal background color
                      buttonText: 'Faculty Account',
                      textColorHex: Colors.white.value,
                      buttonBorder: BorderSide(color: Color(0xFF1867B0), width: 1),
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
