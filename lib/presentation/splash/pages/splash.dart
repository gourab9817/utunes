import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:utune/core/configs/assets/app_vectors.dart';
import 'package:utune/presentation/intro/pages/get_started.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // Add any initialization logic here, such as a timer or navigation
    redirect();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SvgPicture.asset(
          AppVectors.logo, // Path to your SVG asset
            
        ),
        
      ),
    );
  }
  Future<void>  redirect() async{
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacement(
      
      context,
      MaterialPageRoute(
        builder: (context) => const GetStartedPage(), // Replace with your next page
      ),
    );
  }
}