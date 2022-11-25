import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login/sign-up.dart';

class OptionPage extends StatefulWidget {
  const OptionPage({Key? key}) : super(key: key);

  @override
  State<OptionPage> createState() => _OptionPageState();
}

class _OptionPageState extends State<OptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('オプション'),
        backgroundColor: const Color(0xFFff8e3c),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextButton(
              onPressed: () {

              },
              child: Row(
                children: [
                  Icon(Icons.lightbulb_outline,size: 25,color: Colors.black,),
                  SizedBox(width: 10,),
                  Text('',style: TextStyle(fontSize: 25,color: Colors.black),)
                ],
              ),
            ),
            TextButton(
              onPressed: () {

              },
              child: Row(
                children: [
                  Icon(Icons.account_circle_rounded,size: 25,color: Colors.black,),
                  SizedBox(width: 10,),
                  Text('アカウント',style: TextStyle(fontSize: 25,color: Colors.black),)
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                if (FirebaseAuth.instance.currentUser != null) {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SignupPage()));
                }
              },
              child: Row(
                children: [
                  Icon(Icons.logout,size: 25,color: Colors.black,),
                  SizedBox(width: 10,),
                  Text('ログアウト',style: TextStyle(fontSize: 25,color: Colors.black),)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
