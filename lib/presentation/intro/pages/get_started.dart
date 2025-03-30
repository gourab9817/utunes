import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:utune/core/configs/assets/app_images.dart';
import 'package:utune/core/configs/assets/app_vectors.dart';
import 'package:utune/core/configs/theme/app_colors.dart';
import 'package:utune/common/widgets/button/basic_app_button.dart';
import 'package:utune/presentation/choose_mode/pages/choose_mode.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit:BoxFit.fill,
                image: AssetImage(

                  AppImages.introBG, // Path to your image asset
                )
                )
            ),
            
          ),
          Container(
            color: Colors.black.withOpacity(0.15),
          ),

          Padding(padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
            child:Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child:SvgPicture.asset(
                    AppVectors.logo, // Path to your SVG asset
                  ),
                ),
                const Spacer(),
                const Text(
                  "Enjoy seamless music streaming",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  "Listen to your favorite songs and podcasts without any interruptions. Access millions of tracks and create your own playlists.",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    color: AppColors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 25,),
                BasicAppButton(
                  onPressed: () {
                    // Handle button press
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const ChooseModePage(), // Replace with your next page
                      ),
                    );
                  },
                  title: "Get Started",
                  height: 60,
                ),
                const SizedBox(height: 20,),
              ],
            ),
          )
        ]
      ),
    );
  }
}