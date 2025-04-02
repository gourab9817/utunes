import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:utune/core/configs/theme/app_theme.dart';
import 'package:utune/presentation/splash/pages/splash.dart';
import 'package:utune/presentation/choose_mode/bloc/theme_cubit.dart';
import 'package:utune/service_locator.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorageDirectory.web
        : HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );

  // If you want to use HydratedBloc:
  HydratedBloc.storage = storage;
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  await initializeDependencies(); // Initialize your dependencies
  runApp(const RootApp());
}

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit(),  // Provide your ThemeCubit
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Listen to changes in the ThemeCubit’s state (which is a ThemeMode)
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,

          // Use the themeMode from ThemeCubit:
          themeMode: themeMode,

          // Your light theme:
          theme: AppTheme.lightTheme,

          // Your dark theme (you can define your own or use ThemeData.dark()):
          darkTheme: AppTheme.darkTheme,

          home: const SplashPage(),
        );
      },
    );
  }
}
