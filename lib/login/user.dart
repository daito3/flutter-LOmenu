import 'package:flutter/material.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  String _user_name = "";

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

              SizedBox(
                height: 40,
              ),

              TextFormField(
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: 'ユーザー名',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                obscureText: true,

                onChanged: (String value) {
                  setState(() {
                    _user_name = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
