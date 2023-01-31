import 'package:flutter/material.dart';

class ChattingListView extends StatelessWidget {
  const ChattingListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userList = ['김파수', '이파수', '박파수'];
    var userProfilePics = ['assets/images/1.png', 'assets/images/2.png', 'assets/images/3.png'];
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: const Text(
          'Chatting',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
            icon: const Icon(
              Icons.logout
            ),
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
