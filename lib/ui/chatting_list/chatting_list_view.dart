import 'package:emo_chat_mobile/main.dart';
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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: const Text(
          'Chatting',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 30
          ),
        ),
        backgroundColor: Colors.white,
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
            color: Colors.black,
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
                          const MyHomePage(title: "Chatting Test View")));
            },
            child: Card(
              child: Row(
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.asset(userProfilePics[index]),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Text(
                          userList[index],
                          style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w100,
                              color: Colors.black),
                        ),
                        const SizedBox(
                          height: 40,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
