import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // UserInfo? user;
  bool isLoading = false;

  // void _handleSubmit(BuildContext ctx) async {
  //   final responseProvider = Provider.of<ResponseProvider>(ctx, listen: false);
  //   // if (_formKey.currentState?.validate() == true) {
  //   responseProvider.isBusy(true); // loading on
  //   await ctx.read<AuthProvider>().login({
  //     'email': emailController.text, // Here are the textfield values
  //     'password': passwordController.text
  //   }).then((_) async {
  //     GoRouter.of(context).go('/home');
  //   }, onError: (err) {
  //     responseProvider.snackBarOnError(err, context);
  //     print(err);
  //   });
  //   responseProvider.isBusy(false); // loading off
  //   // }
  // }

  // Future<void> checkUser() async {
  //   final responseProvider =
  //       Provider.of<ResponseProvider>(context, listen: false);
  //   responseProvider.isBusy(true);
  //   await Provider.of<AuthProvider>(context, listen: false).getUserInfo().then(
  //       (_) async {
  //     GoRouter.of(context).go('/home');
  //   }, onError: (err) => print(err));
  //   responseProvider.isBusy(false);
  // }

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) async {
    //   checkUser();
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    const SizedBox(height: 20),

                    const SizedBox(height: 50),
                    const Text(
                      'Welcome back!',
                      style: TextStyle(color: Color(0xFF424242), fontSize: 16),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF2596BE),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                  ),
                  child: Flexible(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25, 40, 25,
                          100), // Adjusted padding with bottom spacing
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Please enter account details',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(height: 20),
                            
                            const SizedBox(height: 10),
                            
                            const SizedBox(height: 10),
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
                            const SizedBox(height: 30),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () => {
                                  print("pressed")
                                },
                                // onPressed: () => _handleSubmit(context),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 187, 21, 71),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 15),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
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
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}
