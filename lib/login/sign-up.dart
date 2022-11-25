import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../home.dart';
import '../mypage.dart';
import 'login.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  // final userID = FirebaseAuth.instance.currentUser?.uid ?? 'test';

  String _user_name = "";
  String _email = "";
  String _password = "";
  String test = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFF9DE),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(test),
              // アプリのアイコン
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
                  )),
              SizedBox(
                height: 40,
              ),
              // 1行目 ユーザーネーム入力用テキストフィールド
              TextFormField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'ユーザー名',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                // obscureText: true,

                onChanged: (String value) {
                  setState(() {
                    _user_name = value;
                  });
                },
              ),
              SizedBox(
                height: 15,
              ),
              //　２行目 メールアドレス入力用テキストフィールド
              TextFormField(
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'メールアドレス',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
                onChanged: (String value) {
                  setState(() {
                    _email = value;
                  });
                },
              ),
              SizedBox(
                height: 15,
              ),
              // ３行目 パスワード入力用テキストフィールド
              TextFormField(
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: 'パスワード',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
                obscureText: true,
                onChanged: (String value) {
                  setState(() {
                    _password = value;
                  });
                },
              ),
              SizedBox(
                height: 50,
              ),
              // 3行目 ユーザ登録ボタン
              SizedBox(
                width: 320,
                height: 60,
                child: ElevatedButton(
                  child: const Text(
                    'ユーザ登録',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () async {
                    try {
                      // ここで新規登録処理を行う。
                      final User? user = (await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: _email, password: _password))
                          .user;
                      if (user != null) {
                        print("ユーザ登録しました ${user.email} , ${user.uid}");
                        test = "ユーザ登録しました ";
                        // ここでログイン処理を行う。
                        final FirebaseAuth auth = FirebaseAuth.instance;
                        final UserCredential result =
                            await auth.signInWithEmailAndPassword(
                          email: _email,
                          password: _password,
                        );
                        if (FirebaseAuth.instance.currentUser != null) {
                          var uid = FirebaseAuth.instance.currentUser?.uid;
                          //　ここでユーザーの情報を入れる。
                          FirebaseFirestore.instance
                              .collection('userCollection')
                              .doc(uid)
                              .set({'UserName': _user_name,'email':_email});
                          //　ホームページに移動
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MyHomePage(email: user.email)),
                            (Route<dynamic> route) => false,
                          );
                        }
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              ElevatedButton(
                child: Text(
                  "Go to login page",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return LoginPage();
                    }),
                  );
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
