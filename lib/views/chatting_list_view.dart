import 'package:emo_chat_mobile/views/emoji_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChattingListView extends StatefulWidget {
  const ChattingListView({Key? key}) : super(key: key);

  @override
  State<ChattingListView> createState() => _ChattingListViewState();
}

class _ChattingListViewState extends State<ChattingListView> {
  @override
  Widget build(BuildContext context) {
    var userList = ['김민욱', '이제훈', '박명수'];
    var userProfilePics = [
      'assets/images/1.png',
      'assets/images/2.png',
      'assets/images/3.png'
    ];
    var messageSentTimeList = [
      '오후 4:30',
      '어제',
      '2022/12/31'
    ];
    var messageList = [
      '안녕하세요!',
      '안녕',
      '새해 복 많이 받으세요'
    ];
    final bool lightMode = Theme.of(context).brightness == Brightness.light;
    final Color textColor = lightMode ? Colors.black : Colors.white;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: const Text(
          'Chatting',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30
          ),
        ),
        //backgroundColor: lightMode ? Colors.white : Colors.black12,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: const Text('로그아웃 하시겠습니까?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('아니오'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.popUntil(context, (route) => route.isFirst);
                        },
                        child: const Text('예'),
                      )
                    ],
                  );
                },
              );
            },
            icon: const Icon(Icons.logout),
            //color: textColor,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  CupertinoPageRoute(
                      builder: (context) =>
                          EmojiView()));
            },
            child: Card(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: Image.asset(userProfilePics[index]),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userList[index],
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              messageList[index],
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w100
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Column(
                          children: [
                            Text(
                              messageSentTimeList[index],
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w100,
                              ),
                              textAlign: TextAlign.end,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
