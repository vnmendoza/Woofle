import 'package:flutter/material.dart';
import 'package:woofle/Components/chat_storage.dart';

import '../constants.dart';

class AllChat extends StatefulWidget {
  const AllChat({Key? key}) : super(key: key);

  @override
  _AllChatState createState() => _AllChatState();
}

class _AllChatState extends State<AllChat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "Messages",
                style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.bold, color: primaryColor),
              ),
              Container(
                height: 25,
                width: 1,
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.15)),
              ),
              Text(
                "Matches",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black.withOpacity(0.5)),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          thickness: 0.8,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, top: 0, right: 8),
          child: Container(
            height: 38,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(5)),
            child: TextField(
              cursorColor: Colors.black.withOpacity(0.5),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black.withOpacity(0.5),
                  ),
                  hintText: "Search 0 Matches"),
            ),
          ),
        ),
        const Divider(
          thickness: 0.8,
        ),
        const SizedBox(
          height: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Text(
                "New Matches",
                style: TextStyle(
                    fontSize: 15, fontWeight: FontWeight.w500, color: primaryColor),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                    children: List.generate(chats_json.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 70,
                              height: 70,
                              child: Stack(
                                children: <Widget>[
                                  chats_json[index]['story']
                                      ? Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: primaryColor, width: 3)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Container(
                                        width: 70,
                                        height: 70,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    chats_json[index]['img']),
                                                fit: BoxFit.cover)),
                                      ),
                                    ),
                                  )
                                      : Container(
                                    width: 65,
                                    height: 65,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                chats_json[index]['img']),
                                            fit: BoxFit.cover)),
                                  ),
                                  chats_json[index]['online']
                                      ? Positioned(
                                    top: 48,
                                    left: 52,
                                    child: Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: Colors.white, width: 3)),
                                    ),
                                  )
                                      : Container()
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 70,
                              child: Align(
                                  child: Text(
                                    chats_json[index]['name'],
                                    overflow: TextOverflow.ellipsis,
                                  )),
                            )
                          ],
                        ),
                      );
                    })),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                children: List.generate(userMessages.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Row(
                      children: <Widget>[
                        Container(
                          width: 70,
                          height: 70,
                          child: Stack(
                            children: <Widget>[
                              userMessages[index]['story']
                                  ? Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: primaryColor, width: 3)),
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Container(
                                    width: 70,
                                    height: 70,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: AssetImage(
                                                userMessages[index]
                                                ['img']),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                              )
                                  : Container(
                                width: 65,
                                height: 65,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            userMessages[index]['img']),
                                        fit: BoxFit.cover)),
                              ),
                              userMessages[index]['online']
                                  ? Positioned(
                                top: 48,
                                left: 52,
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: Colors.white, width: 3)),
                                ),
                              )
                                  : Container()
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              userMessages[index]['name'],
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 135,
                              child: Text(
                                userMessages[index]['message'] +
                                    " - " +
                                    userMessages[index]['created_at'],
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black.withOpacity(0.8)),
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                }),
              ),
            )
          ],
        )
      ],
    );
  }
}