import 'package:dartz/dartz.dart';
import 'package:utune/core/usecase/usecase.dart';
import 'package:utune/data/models/auth/create_user_req.dart';
import 'package:utune/domain/repository/auth/auth.dart';
import 'package:utune/service_locator.dart';

class SignupUseCase implements UseCase<Either,CreateUserReq> {
  @override
  Future<Either> call({CreateUserReq? params}) async {
    return sl<AuthRepository>().signup(params!);
  }
}