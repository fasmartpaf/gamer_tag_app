import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gamer_tag_app/src/Model/currentUer.dart';
import 'package:gamer_tag_app/src/ui/pages/home_page.dart';
import 'package:gamer_tag_app/src/ui/widgets/buttons.dart';
import 'package:gamer_tag_app/src/utils/colors.dart';
import 'package:gamer_tag_app/src/utils/images.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../Model/auth.dart';
import '../../../utils/nav.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _isSigningIn = false;
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();
  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.yellowColor,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 50),
          Center(
            child: Image.asset(
              AppImages.gamerTagLogo,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          _buildWhiteText(
            text: 'Home To Gamers',
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: Image.asset(
              AppImages.appLogo,
              height: 80,
              width: 80,
            ),
          ),
          _buildWhiteText(
            text: 'Find your partner\nand play games together!',
          ),
          const Spacer(),
          const Text(
            'By signing up for GamerTag, you agree to our Terms of Services.\nLearn how we process your data in our Privacy Policy and\nCookies Policy.',
            style: TextStyle(fontSize: 6),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 5,
          ),
          AuthButton(
              text: 'Login with Apple',
              onTap: () {
                // AppNavigation.push(context, const HomePage());
              },
              colorBtn: Colors.black,
              btnImage: AppImages.appleLogo),
          const SizedBox(
            height: 10,
          ),
          AuthButton(
              text: 'Login with Google',
              onTap: () async {
                _handleSignIn();
                // setState(() {
                //   _isSigningIn = true;
                // });
                //
                // User? user =
                // await Authentication.signInWithGoogle(context: context);
                //
                // setState(() {
                //   _isSigningIn = false;
                // });
                //
                //     .then((user) => user.uid);
                // Navigator.of(context).pushReplacement(
                //   MaterialPageRoute(
                //     builder: (context) => HomePage(
                //
                //     ),
                //   ),
                // );
              },
              colorBtn: const Color.fromRGBO(255, 255, 255, 0.5),
              btnImage: AppImages.googleLogo,
              colorText: Colors.black),
          const SizedBox(
            height: 10,
          ),
          RichText(
            text: const TextSpan(
                text: 'Don’t have an account?',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 13,
                ),
                children: [
                  TextSpan(
                    text: ' Sign Up',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                    ),
                  ),
                ]),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 50),
        ],
      )),
    );
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );
  // Future<void> _handleSignIn() async {
  //   try {
  //     var user=await _googleSignIn.signIn();
  //
  //     if(user!=null){
  //      var user2= await auth
  //           .signInWithEmailAndPassword( email: user.email,password: user.id);
  //    FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;
  //
  //
  //    // currentUser.username=user.displayName;
  //    // currentUser.email=user.email;
  //    // currentUser.imageUrl=user.photoUrl;
  //    // currentUser.userId=user1.uid;
  //
  //
  //      // AppNavigation.push(context, const HomePage());
  //
  //     }
  //   } catch (error) {
  //     print(error);
  //   }
  // }
  Future<void> _handleSignIn() async {
    try {
      var user = await _googleSignIn.signIn();

      if (user != null) {
        FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setBool('id', true);

        if (prefs.getString('uid') != user.id) {
          firebaseFirestore.collection('Users').add({
            "name": user.displayName,
            "email": user.email,
            'imageUrl': user.photoUrl,
            'uid': user.id,
          });
        }
        prefs.setString('uid', user.id);
        AppNavigation.push(context, HomePage());

        // currentUser.username=user.displayName;
        // currentUser.email=user.email;
        // currentUser.imageUrl=user.photoUrl;
        // currentUser.userId=user1.uid;

      }
    } catch (error) {
      print(error);
    }
  }

  Widget _buildWhiteText({required String text}) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 13,
        color: const Color(0xffffffff).withOpacity(0.5),
      ),
    );
  }
}
