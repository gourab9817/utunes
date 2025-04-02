import 'package:get_it/get_it.dart';
import 'package:utune/data/sources/auth/auth_firebase_service.dart';
import 'package:utune/domain/repository/auth/auth.dart';
import 'package:utune/data/repository/auth/auth_repository_imp.dart';
import 'package:utune/domain/usecases/auth/signin.dart';
import 'package:utune/domain/usecases/auth/signup.dart';

final sl= GetIt.instance;
Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl()
  );

  sl.registerSingleton<AuthRepository>(
    AuthRepositoryImp()
 );

 sl.registerSingleton<SignupUseCase>(
    SignupUseCase()
 );
 sl.registerSingleton<SigninUseCase>(
    SigninUseCase()
 );
} 