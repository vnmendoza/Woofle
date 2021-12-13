import 'package:flutter/material.dart';
import 'package:woofle/Components/likes_json.dart';
import 'package:woofle/constants.dart';

class LikesPage extends StatefulWidget {
  @override
  _LikesPageState createState() => _LikesPageState();
}

class _LikesPageState extends State<LikesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: getBody(),
      bottomSheet: getFooter(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return ListView(
      padding: const EdgeInsets.only(bottom: 90),
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                likesJson.length.toString() + " Likes",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "Top Picks",
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
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Wrap(
            spacing: 5,
            runSpacing: 5,
            children: List.generate(likesJson.length, (index) {
              return Container(
                width: (size.width - 15) / 2,
                height: 250,
                child: Stack(
                  children: [
                    Container(
                      width: (size.width - 15) / 2,
                      height: 250,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage((likesJson[index]['img'])),
                              fit: BoxFit.cover)),
                    ),
                    Container(
                      width: (size.width - 15) / 2,
                      height: 250,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                              colors: [
                                Colors.black.withOpacity(0.25),
                                Colors.black.withOpacity(0),
                              ],
                              end: Alignment.topCenter,
                              begin: Alignment.bottomCenter)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          likesJson[index]['active']
                              ? Padding(
                            padding:
                            const EdgeInsets.only(left: 8, bottom: 8),
                            child: Row(
                              children: [
                                Container(
                                  width: 8,
                                  height: 8,
                                  decoration: const BoxDecoration(
                                      color: Colors.green,
                                      shape: BoxShape.circle),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  "Recently Active",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                )
                              ],
                            ),
                          )
                              : Padding(
                            padding:
                            const EdgeInsets.only(left: 8, bottom: 8),
                            child: Row(
                              children: [
                                Container(
                                  width: 8,
                                  height: 8,
                                  decoration: const BoxDecoration(
                                      color: Colors.grey,
                                      shape: BoxShape.circle),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  "Offline",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            }),
          ),
        )
      ],
    );
  }

  Widget getFooter() {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: 90,
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          children: [
            Container(
              width: size.width - 70,
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: const LinearGradient(colors: [primaryColor, tertiaryColor])),
              child: const Center(
                child: Text("SEE WHO LIKES YOU",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
              ),
            )
          ],
        ),
      ),
    );
  }
}