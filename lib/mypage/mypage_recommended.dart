import 'package:flutter/material.dart';

class MypageRecommended extends StatefulWidget {
  const MypageRecommended({Key? key}) : super(key: key);

  @override
  State<MypageRecommended> createState() => _MypageRecommendedState();
}

class _MypageRecommendedState extends State<MypageRecommended> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
      height: screenSize.height * 0.29,
      width: screenSize.width * 1,
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey, //色
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(1, 1),
          ),
        ],
        color: Colors.white,
      ),
      child: Column(
        children: [
          SizedBox(height: screenSize.height * 0.01),
          Expanded(
              flex: 2,
              child: Container(
                height: double.infinity,
                child: const Text(
                  "今日のおすすめ",
                  style: TextStyle(
                    fontSize: 27,
                  ),
                ),
              )),
          Expanded(
              flex: 8,
              child: Container(
                //color: Colors.grey,
                child: Row(
                  children: [
                    Expanded(
                        flex: 5,
                        child: Container(
                          color: Colors.white,
                          child: Container(
                              margin: const EdgeInsets.fromLTRB(
                                  10, 0, 10, 10),
                              child: Image.asset(
                                  'assets/mypage_food_image.jpg')
                            //color: Colors.red,
                          ),
                        )),
                    Expanded(
                        flex: 3,
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                          child: Column(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: Container(
                                    //color: Colors.red,
                                    child: Text(
                                      "焼肉",
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  )),
                              Expanded(
                                  flex: 6,
                                  child: Container(
                                    //color: Colors.red,
                                    margin: EdgeInsets.all(10),
                                    child: Text("みんなで食べに行きたいよね！"
                                        "肉大好き\n"
                                        "お腹hetta！"),
                                  )),
                            ],
                          ),
                        ))
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
