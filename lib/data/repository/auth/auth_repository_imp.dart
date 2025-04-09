import 'package:dartz/dartz.dart';
import 'package:utune/data/models/auth/create_user_req.dart';
import 'package:utune/data/models/auth/signin_user_req.dart';
import 'package:utune/data/sources/auth/auth_supabase_service.dart';
import 'package:utune/domain/repository/auth/auth.dart';
import 'package:utune/service_locator.dart';

class AuthRepositoryImp extends AuthRepository {
  // final AuthSupabaseService _authSupabaseService;
  
  // AuthRepositoryImp(this._authSupabaseService);
  
  @override
  Future<Either> signin(SigninUserReq signinUserReq) async {
    // Implement Supabase signin logic here
    return await sl<AuthSupabaseService>().signin(signinUserReq);
  }
  
  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    // Implement Supabase signup logic here
    return await sl<AuthSupabaseService>().signup(createUserReq);
  }
}
