import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:utune/core/configs/assets/app_vectors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SvgPicture.asset(
            AppVectors.logo, // Path to your SVG asset
            
          ),
        ),
      ),
    );
  }
}