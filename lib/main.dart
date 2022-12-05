import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lomenu/home.dart';

import 'firebase_options.dart';
import 'login/sign-up.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp(
  )));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if(FirebaseAuth.instance.currentUser != null) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'test',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(),
      );
    }else{
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'test',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SignupPage(),
      );
    }
  }
}