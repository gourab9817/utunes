import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:utune/common/widgets/appbar/app_bar.dart';
import 'package:utune/common/widgets/button/basic_app_button.dart';
import 'package:utune/core/configs/assets/app_vectors.dart';
import 'package:utune/data/models/auth/create_user_req.dart';
import 'package:utune/domain/usecases/auth/signup.dart';
import 'package:utune/presentation/auth/pages/signin.dart';
import 'package:utune/presentation/root/pages/root.dart';
import 'package:utune/service_locator.dart';
class SignupPage extends StatelessWidget {
   SignupPage({super.key});
  final TextEditingController _email=TextEditingController();
  final TextEditingController _password=TextEditingController();
  final TextEditingController _fullName=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signinText(context),
      appBar: BasicAppbar(
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 40,
          width: 40,
        ),
      ),
      body:Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 40,
          horizontal: 40
        ),
        child: Column(
          children: [
            _registerText(),
            const SizedBox(height: 50,),
            _fullNameField(context),
            const SizedBox(height: 20,),
            _emailField(context),
            const SizedBox(height: 20,),
            _passswordField(context),
            const SizedBox(height: 20,),
            BasicAppButton(
              onPressed: () async {
                var result=await sl<SignupUseCase>().call(
                  params: CreateUserReq(
                    email: _email.text.toString(),
                    password: _password.text.toString(),
                    fullName: _fullName.text.toString(),
                  )
                );
                result.fold(
                  (l) {
                    var snackbar=SnackBar(content: Text(l));
                    ScaffoldMessenger.of(context).showSnackBar(snackbar);
                  }, 
                  (r) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (BuildContext context) => const RootPage()),
                      (route)=> false,
                    );
                  }
                );
              }, 
              title: 'Create an account',)
          ],
        ),
      )
    );
  }


  Widget _registerText(){
    return Text(
      'Register',
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }
  Widget _fullNameField(BuildContext context){
    return TextField(
      controller: _fullName,
      decoration: InputDecoration(
        hintText:'Full Name',
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme
      )
    );
    

  }

  Widget _emailField(BuildContext context){
    return TextField(
      controller: _email,
      decoration: InputDecoration(
        hintText:'Enter your email',
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme
      )
    );
    

  }

  Widget _passswordField(BuildContext context){
    return TextField(
      controller: _password,
      decoration: InputDecoration(
        hintText:'Enter your Password',
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme
      )
    );
  }


  Widget _signinText(BuildContext context){
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 30,
        
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Already have an account?',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          TextButton(
            onPressed: (){
              // Navigate to the signup page
                              Navigator.pushReplacement(context, MaterialPageRoute(
                                builder: (BuildContext context) =>  SigninPage(),
                              ));
            },
             child: Text(
              'Sign in',
              
             ))
        ],
      ),
    );
  }
}