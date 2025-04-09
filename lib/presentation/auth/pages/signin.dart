import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:utune/common/widgets/appbar/app_bar.dart';
import 'package:utune/common/widgets/button/basic_app_button.dart';
import 'package:utune/core/configs/assets/app_vectors.dart';
import 'package:utune/data/models/auth/signin_user_req.dart';
import 'package:utune/domain/usecases/auth/signin.dart';
import 'package:utune/presentation/auth/pages/signup.dart';
import 'package:utune/presentation/root/pages/root.dart';
import 'package:utune/service_locator.dart';

class SigninPage extends StatelessWidget {
  SigninPage({super.key});
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // Added form key for validation

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signinText(),
      appBar: BasicAppbar(
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 40,
            horizontal: 40
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _registerText(),
                const SizedBox(height: 50,),
                
                _emailField(context),
                const SizedBox(height: 20,),
                _passswordField(context),
                const SizedBox(height: 20,),
                BasicAppButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      // Show loading indicator
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (BuildContext context) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      );
                      
                      try {
                        var result = await sl<SigninUseCase>().call(
                          params: SigninUserReq(
                            email: _email.text.trim(),
                            password: _password.text,
                          )
                        );
                        
                        // Close loading dialog
                        Navigator.pop(context);
                        
                        result.fold(
                          (l) {
                            var snackbar = SnackBar(content: Text(l));
                            ScaffoldMessenger.of(context).showSnackBar(snackbar);
                          }, 
                          (r) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (BuildContext context) => const RootPage()),
                              (route) => false,
                            );
                          }
                        );
                      } catch (e) {
                        // Close loading dialog
                        Navigator.pop(context);
                        
                        var snackbar = SnackBar(content: Text('An error occurred: ${e.toString()}'));
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      }
                    }
                  }, 
                  title: 'Sign In',
                )
              ],
            ),
          ),
        ),
      )
    );
  }

  Widget _registerText() {
    return const Text(
      'Welcome Back',
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }
  
  Widget _emailField(BuildContext context) {
    return TextFormField(
      controller: _email,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your email';
        }
        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
          return 'Please enter a valid email';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: 'Enter your email',
        prefixIcon: const Icon(Icons.email_outlined),
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme
      )
    );
  }

  Widget _passswordField(BuildContext context) {
    return TextFormField(
      controller: _password,
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: 'Enter your Password',
        prefixIcon: const Icon(Icons.lock_outline),
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme
      )
    );
  }

  Widget _signinText() {
    return Builder(
      builder: (BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 30,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Not a member?',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(
                  builder: (BuildContext context) => SignupPage(),
                ));
              },
              child: const Text(
                'Sign Up',
              )
            )
          ],
        ),
      ),
    );
  }
}
// Compare this snippet from lib/presentation/root/pages/root.dart: