import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:utune/common/helpers/isdark_mode.dart';
import 'package:utune/common/widgets/appbar/app_bar.dart';
import 'package:utune/presentation/auth/pages/signin.dart';
import 'package:utune/presentation/auth/pages/signup.dart';
import '../../../common/widgets/button/basic_app_button.dart';
import '../../../core/configs/assets/app_images.dart';
import '../../../core/configs/assets/app_vectors.dart';

class SignupOrSigninPage extends StatelessWidget {
  const SignupOrSigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const BasicAppbar(),
            // Top-right pattern
             Align(
            alignment: Alignment.topRight,
            child: SvgPicture.asset(
              AppVectors.topPattern
            ),
          ),
           Align(
            alignment: Alignment.bottomRight,
            child: SvgPicture.asset(
              AppVectors.bottomPattern
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(
              AppImages.authBG
            )
          ),

            // Main content
            SingleChildScrollView(
              child: Padding(
                // Adjust the vertical padding so your content is lifted upwards
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Extra space at the top if you want it higher
                    const SizedBox(height: 40),
                    
                    SvgPicture.asset(
                      AppVectors.logo,
                    ),
                    const SizedBox(height: 40),
                    
                    Text(
                      'Welcome to UTune',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: context.isDarkMode ? Colors.white : Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),

                    Text(
                      'U Tune is a proprietary Swedish audio streaming '
                      'and media services provider.',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: context.isDarkMode ? Colors.white : Colors.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),

                    Row(
                      children: [
                        Expanded(
                          child: BasicAppButton(
                            onPressed: () {
                              // Navigate to the signup page
                              Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) =>  SignupPage(),
                              ));
                            },
                            title: 'Register',
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              // Navigate to the signup page
                              Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) =>  SigninPage(),
                              ));
                            },
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: context.isDarkMode ? Colors.white : Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    // Some bottom spacing so the buttons don't clash with the bottom graphics
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
