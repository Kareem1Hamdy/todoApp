import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/home/home_screen.dart';
import 'package:todo_app/provider/authProvider.dart';
import 'package:todo_app/registerScreen/register_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
      ChangeNotifierProvider(
      create: (context)=>AppAuthProvider(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider=Provider.of<AppAuthProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     home: provider.isLoggedIn()?HomeScreen():RegisterScreen(),
    );
  }
}