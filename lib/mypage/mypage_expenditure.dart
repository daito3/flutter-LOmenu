import 'package:flutter/material.dart';

class MypageExpenditure extends StatefulWidget {
  const MypageExpenditure({Key? key}) : super(key: key);

  @override
  State<MypageExpenditure> createState() => _MypageExpenditureState();
}

class _MypageExpenditureState extends State<MypageExpenditure> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      height: screenSize.height * 0.3,
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
                  "今月の支出",
                  style: TextStyle(
                    fontSize: 27,
                  ),
                ),
              )),
          Expanded(
              flex: 9,
              child: Container(
                //color: Colors.grey,
                child: Row(
                  children: [
                    Expanded(
                        flex: 5,
                        child: Container(
                          //食材別の支出の円グラフ
                          // margin: const EdgeInsets.all(15),
                          child: Container(
                            child:
                            Image.asset('assets/LOmenu_gurahu.png'),
                          ),
                        )),
                    Expanded(
                        flex: 4,
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                          child: Column(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    color: Colors.white,
                                    margin: EdgeInsets.fromLTRB(
                                        0, 20, 20, 20),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 3,
                                            child: Container(
                                              child: const Text(
                                                '今週',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                ),
                                              ),
                                            )),
                                        Expanded(
                                            flex: 7,
                                            child: Container(
                                              child: Text(
                                                '3000円',
                                                textAlign:
                                                TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 18,
                                                ), //後で変動するとこ
                                              ),
                                            ))
                                      ],
                                    ),
                                  )),
                              Expanded(
                                  flex: 1,
                                  child: Container(
                                    color: Colors.white,
                                    margin: EdgeInsets.fromLTRB(
                                        0, 20, 20, 20),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 3,
                                            child: Container(
                                              child: const Text(
                                                '合計',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                ),
                                              ),
                                            )),
                                        Expanded(
                                            flex: 7,
                                            child: Container(
                                              child: Text(
                                                '21000円',
                                                textAlign:
                                                TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 18,
                                                ),
                                                //後で変動するとこ
                                              ),
                                            ))
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        ))
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
