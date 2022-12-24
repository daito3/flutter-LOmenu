import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
        appBar: AppBar(
          title: Text('アカウント'),
          backgroundColor: const Color(0xFFff8e3c),
        ),
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              //　ユーザーネーム
              Container(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                height: screenSize.height * 0.13,
                width: screenSize.width * 1,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'ユーザーネーム',
                          style: TextStyle(fontSize: 22),
                        ),
                      ],
                    ),
                    SizedBox(height: screenSize.height * 0.01),
                    Row(
                      children: [
                        SizedBox(
                          width: screenSize.width * 0.05,
                        ),
                        Text(
                          'リュぴ',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              //  Mail Address
              Container(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                height: screenSize.height * 0.13,
                width: screenSize.width * 1,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'メールアドレス',
                          style: TextStyle(fontSize: 22),
                        ),
                      ],
                    ),
                    SizedBox(height: screenSize.height * 0.01),
                    Row(
                      children: [
                        SizedBox(
                          width: screenSize.width * 0.05,
                        ),
                        Text(
                          'ryupi@gmail.com',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              //  password　変更
            ],
          ),
        ));
  }
}
