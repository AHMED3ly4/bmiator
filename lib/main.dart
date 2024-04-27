import 'package:bmiator/auth/view/screens/auth_screen.dart';
import 'package:bmiator/auth/view_model/auth_cubit.dart';
import 'package:bmiator/home/view/screens/home_screen.dart';
import 'package:bmiator/shared/theming/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );

  runApp(
      BlocProvider(
        create: (context) => AuthViewModel(),
        child: const Bmiator(),
      )
  );
}


class Bmiator extends StatelessWidget {
  const Bmiator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bmiator",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData,
      routes: {
        AuthScreen.routeName : (context) => const AuthScreen(),
        HomeScreen.routeName : (context) => const HomeScreen(),
      },
    );
  }
}
