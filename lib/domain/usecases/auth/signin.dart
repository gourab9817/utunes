import 'package:dartz/dartz.dart';
import 'package:utune/core/usecase/usecase.dart';
import 'package:utune/data/models/auth/create_user_req.dart';
import 'package:utune/data/models/auth/signin_user_req.dart';
import 'package:utune/domain/repository/auth/auth.dart';
import 'package:utune/service_locator.dart';

class SigninUseCase implements UseCase<Either,SigninUserReq> {
  @override
  Future<Either> call({SigninUserReq? params}) async {
    return sl<AuthRepository>().signin(params!);
  }
}