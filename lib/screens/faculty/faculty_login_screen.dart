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
  final TextEditingController SSOCodeController = TextEditingController();
  
  bool showTextFieldCode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/faculty_login_screen_bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Center(
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

                        if (showTextFieldCode)
                          Column(
                            children: [
                              ButtonCommon(
                                onPressFunctionName: () {
                                  setState(() {
                                    showTextFieldCode = !showTextFieldCode;
                                  });
                                },
                                bgColorOpacity: 255,
                                bgColorHex: Colors.white.value,
                                buttonText: 'Login with SSO',
                                textColorHex: Colors.black.value,
                                iconPath: 'assets/icons/key_icon.png',
                                buttonBorder: BorderSide(color: Colors.black, width: 1),
                              ),

                              SizedBox(height: 12.0),

                              Row(
                              children: [
                                Expanded(
                                  child: TextFieldCommon(
                                    controller: SSOCodeController,
                                    hintText: 'Enter Verification Code',
                                    obscureText: false,
                                    validator: numericValidator,
                                  ),
                                ),
                                SizedBox(width: 5.0),
                                Container(
                                  height: 48.5, // Adjust the height as needed
                                  width: 45, // Adjust the width as needed
                                  child: ElevatedButton(
                                    onPressed: () {
                                      GoRouter.of(context).go('/faculty-login');
                                    },
                                    style: ElevatedButton.styleFrom(
                                      primary: Color(0xFF3E8AD0), // Background color
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(6.0),
                                      ),
                                    ),
                                    child: Text(
                                      ">",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),  
                            ],
                          )
                        else
                          Column(
                            children: [
                              ButtonCommon(
                                onPressFunctionName: () {
                                  setState(() {
                                    showTextFieldCode = !showTextFieldCode;
                                  });
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
                                  GoRouter.of(context).go('/faculty-login');
                                },
                                bgColorOpacity: 255,
                                bgColorHex: Colors.white.value,
                                buttonText: 'Sign in With Microsoft Account',
                                textColorHex: Colors.black.value,
                                iconPath: 'assets/icons/microsoft_icon.png',
                                buttonBorder: BorderSide(color: Colors.black, width: 1),
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
                onTap: () {
                  print('Trouble clicked');
                },
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: Text(
                    'Having trouble signing in?',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white,
                      color: Colors.white
                    ),
                  ),
                  ),
                ),
              ),
          ],
        )
        
      ),
    );
  }
}
