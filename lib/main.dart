// ignore_for_file: prefer_const_constructors

import 'package:amazon_clone_tutorial/constants/global_variables.dart';
import 'package:amazon_clone_tutorial/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone_tutorial/providers/user_provider.dart';
import 'package:amazon_clone_tutorial/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context)=> UserProvider()),
    ]
  
  ,child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Amazon Clone",
        theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary: GlobalVariables.secondaryColor,
        ),

          appBarTheme: AppBarTheme(
             
             
            elevation: 0,
            iconTheme: IconThemeData(
              color:Colors.black)
          ),

        ),
        onGenerateRoute: (settings)=> generateRoute(settings),
        home: const AuthScreen(),
    );
  }
} 