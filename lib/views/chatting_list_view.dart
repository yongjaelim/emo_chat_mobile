import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/message_view_model.dart';
import 'chatting_room/chat_view.dart';

class ChattingListView extends StatelessWidget {
  const ChattingListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userList = ['김민욱', '이제훈', '박명수'];
    var userProfilePics = [
      'assets/images/1.png',
      'assets/images/2.png',
      'assets/images/3.png'
    ];


    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: const Text(
          'Chatting',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
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
                          Navigator.pop(context);
                          Navigator.pop(context);
                          //Navigator.popUntil(context, (route) => route.isFirst);
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
                      // EmojiView()

                      ChatView(
                    userName: userList[index],
                    index: index,
                  ),
                ),
              );
            },
            child: Card(
              child: Container(
                padding: const EdgeInsets.all(10),
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
                            Consumer<MessageViewModel>(
                              builder: (context, messageViewModel, child) {
                                return Text(
                                  messageViewModel.messagePreviewList[index],
                                  style: const TextStyle(
                                      fontSize: 15, fontWeight: FontWeight.w100),
                                );
                              },
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
                            Consumer<MessageViewModel>(
                              builder: (context, messageViewModel, child) {
                                return Text(
                                  messageViewModel.messageSentTimeList[index],
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w100,
                                  ),
                                  textAlign: TextAlign.end,
                                );
                              },
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
