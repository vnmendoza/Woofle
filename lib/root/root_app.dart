import 'package:flutter/material.dart';
import 'package:woofle/root/all_chat.dart';
import 'package:woofle/constants.dart';
import 'package:woofle/root/explorer_page.dart';
import '../constants.dart';
import 'account_page.dart';
import 'find_page.dart';
import 'likes_page.dart';

// this is the main page where all other pages will run through
class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: getAppBar(),
      ),
      body: getBody(),
    );
  }
// the body is the thing under the app bar
  //this area changes depending on what icon you choose from the app bar
  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: [ExplorePage(),LikesPage(),AllChat(),AccountPage(),],
    ); //IndexedStack
  } //getBody
// app bar displays different icons that you can click on to change pages
  Widget getAppBar() {
    List bottomItems = [
      pageIndex == 0 ? Icons.recent_actors : Icons.recent_actors_outlined,
      pageIndex == 1 ? Icons.favorite : Icons.favorite_border,
      pageIndex == 2 ? Icons.textsms : Icons.textsms_outlined,
      pageIndex == 3
          ? Icons.settings_applications
          : Icons.settings_applications_outlined,
    ];
    return AppBar(
      backgroundColor: primaryPastelColor,
      elevation: 0,
      title: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(bottomItems.length, (index) {
              return IconButton(
                onPressed: () {
                  setState(() {
                    pageIndex = index;
                  }); //setState
                },
                icon: Icon(
                  //Icons.person,
                  bottomItems[index],
                  color: primaryColor,
                ),
              );
            }),
          )),
    ); //return AppBar
  } //getAppBar

} //_RootPageState
