import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gamer_tag_app/src/ui/views/chat_bottom_view.dart';
import 'package:gamer_tag_app/src/ui/views/home_bottom_view.dart';
import 'package:gamer_tag_app/src/ui/views/profile_bottom_view.dart';
import 'package:gamer_tag_app/src/utils/colors.dart';
import 'package:gamer_tag_app/src/utils/images.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'auth/sign_in_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _currentIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  onChange(int index) {
    _currentIndex = index;
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _widgets = [
      const HomeBottomView(),
      const ChatBottomView(),
      const ProfileBottomView(),
    ];
  }

  late List<Widget> _widgets;
  GoogleSignIn googleSignIn = GoogleSignIn();
  getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var user = await googleSignIn.signOut();

    sharedPreferences.setBool('id', false);

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const SignInPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
              onPressed: () async {
                getData();
              },
              child: const Text('Sign Out'))
        ],
      ),
      backgroundColor: AppColors.yellowColor,
      key: _scaffoldKey,
      body: SafeArea(child: _widgets[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: AppColors.yellowColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedIconTheme: IconThemeData(color: AppColors.pinkColor),
        currentIndex: _currentIndex,
        selectedItemColor: AppColors.pinkColor,
        type: BottomNavigationBarType.fixed,
        onTap: onChange,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              _currentIndex == 0
                  ? AppImages.homeColoredBottom
                  : AppImages.homeBottom,
              height: 40,
              width: 40,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              _currentIndex == 1
                  ? AppImages.chatColoredBottom
                  : AppImages.chatBottom,
              height: 40,
              width: 40,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              _currentIndex == 2
                  ? AppImages.profileColoredBottom
                  : AppImages.profileBottom,
              height: 40,
              width: 40,
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}
