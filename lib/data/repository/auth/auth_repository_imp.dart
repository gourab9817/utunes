import 'package:dartz/dartz.dart';
import 'package:utune/data/models/auth/create_user_req.dart';
import 'package:utune/data/models/auth/signin_user_req.dart';
import 'package:utune/data/sources/auth/auth_firebase_service.dart';
import 'package:utune/domain/repository/auth/auth.dart';
import 'package:utune/service_locator.dart';

class AuthRepositoryImp extends AuthRepository {

  // final AuthFirebaseService _authFirebaseService;

  // AuthRepositoryImp(this._authFirebaseService);

  @override
  Future<Either> signin(SigninUserReq signinUserReq) async {
    // Implement Firebase signup logic here
    return await sl<AuthFirebaseService>().signin(signinUserReq);
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    // Implement Firebase signup logic here
    return await sl<AuthFirebaseService>().signup( createUserReq);
  }
}

