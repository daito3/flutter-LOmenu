import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lomenu/home.dart';

import '../mypage/mypage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

// MyApp,MyHomePageはデフォルトから変更がないため省略

class _LoginPageState extends State<LoginPage>{
  String _email = "";
  String _password = "";
  String test = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFF9DE),
      body: SingleChildScrollView(
        child: Container(
          //color: Color(),
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(test),
              //アプリのアイコン
              SizedBox(
                height: 10,
              ),
              Container(
                  width: 128,
                  height: 128,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Center(
                    child: Container(
                      width: 100,
                      height: 100,
                      child: Image.asset('assets/LOmenu-icon.png'),
                    ),
                  )
              ),
              // 1行目 メールアドレス入力用テキストフィールド
              SizedBox(
                height: 40,
              ),
              TextFormField(
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    labelText: 'メールアドレス',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )
                ),
                onChanged: (String value) {
                  setState(() {
                    _email = value;
                  });
                },
              ),
              SizedBox(
                height: 15,
              ),
              // 2行目 パスワード入力用テキストフィールド
              TextFormField(
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    labelText: 'パスワード',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )
                ),
                obscureText: true,
                onChanged: (String value) {
                  setState(() {
                    _password = value;
                  });
                },
              ),
              SizedBox(
                height: 60,
              ),
              // 3行目 ログインボタン
              SizedBox(
                width: 320,
                height: 60,
                child: ElevatedButton(
                  child: const Text('ログイン',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () async {
                    try {
                      // メール/パスワードでログイン
                      final User? user = (await FirebaseAuth.instance
                          .signInWithEmailAndPassword(
                          email: _email, password: _password))
                          .user;
                      if (user != null){
                        print("ログインしました　${user.email} , ${user.uid}");
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => MyHomePage( email : user.email)),
                              (Route<dynamic> route) => false,
                        );
                      }

                      test = "ユーザログインしました ";
                    } catch (e) {
                      print(e);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                    ),
                  ),
                ),
              ),
              Container(
                height: 60,
                child: const Text("or",
                  style: TextStyle(
                    fontSize: 26,
                  ),
                ),
              ),
              // SizedBox(
              //   child: ElevatedButton(
              //     child: Text(""),
              //     onPressed: () {
              //
              //     },
              //   ),
              // ),
              ElevatedButton(
                child: Text("Go to sing up page",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.transparent,
                  elevation: 0,
                  onPrimary: Colors.grey,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}