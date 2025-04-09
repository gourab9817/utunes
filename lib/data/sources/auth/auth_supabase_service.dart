import 'package:dartz/dartz.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:utune/data/models/auth/create_user_req.dart';
import 'package:utune/data/models/auth/signin_user_req.dart';

abstract class AuthSupabaseService {
  Future<Either<String, String>> signup(CreateUserReq createUserReq);
  Future<Either<String, String>> signin(SigninUserReq signinUserReq);
}

class AuthSupabaseServiceImpl extends AuthSupabaseService {
  final supabase = Supabase.instance.client;
  
  @override
  Future<Either<String, String>> signin(SigninUserReq signinUserReq) async {
    try {
      // Using the toMap method from the model
      final userData = signinUserReq.toMap();
      
      final response = await supabase.auth.signInWithPassword(
        email: userData['email'],
        password: userData['password']
      );
      
      if (response.user != null) {
        return const Right('Signin was Successful');
      } else {
        return const Left('Failed to sign in');
      }
    } on AuthException catch(e) {
      String message = '';
      
      if(e.message.contains('Invalid login credentials')) {
        message = 'No user found or wrong password.';
      } else if (e.message.contains('Email not confirmed')) {
        message = 'Please confirm your email first.';
      } else if (e.message.contains('Invalid email')) {
        message = 'The email address is not valid.';
      } else {
        message = e.message;
      }
      
      return Left(message);
    } catch (e) {
      return Left('An unexpected error occurred: ${e.toString()}');
    }
  }

  @override
  Future<Either<String, String>> signup(CreateUserReq createUserReq) async {
    try {
      // Using the toMap method from the model
      final userData = createUserReq.toMap();
      
      final response = await supabase.auth.signUp(
        email: userData['email'],
        password: userData['password']
      );
      
      if (response.user != null) {
        // Create a user profile in the 'profiles' table
        await supabase.from('profiles').insert({
          'id': response.user!.id,
          'full_name': userData['full_name'],
          'email': userData['email'],
          'created_at': DateTime.now().toIso8601String(),
        });
        
        return const Right('Signup was Successful');
      } else {
        return const Left('Failed to sign up');
      }
    } on AuthException catch(e) {
      String message = '';
      
      if(e.message.contains('weak-password')) {
        message = 'The password provided is too weak';
      } else if (e.message.contains('email-already-in-use')) {
        message = 'An account already exists with that email.';
      } else if (e.message.contains('invalid-email')) {
        message = 'The email address is not valid.';
      } else {
        message = e.message;
      }
      
      return Left(message);
    } catch (e) {
      return Left('An unexpected error occurred: ${e.toString()}');
    }
  }
}
