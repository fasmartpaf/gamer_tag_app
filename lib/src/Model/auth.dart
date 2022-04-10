import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:gamer_tag_app/src/Model/currentUer.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authentication {
  static Future<User?> signInWithGoogle({required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;

    if (kIsWeb) {
      GoogleAuthProvider authProvider = GoogleAuthProvider();

      try {
        final UserCredential userCredential =
        await auth.signInWithPopup(authProvider);

        user = userCredential.user;
      } catch (e) {
        print(e);
      }
    } else {
      final GoogleSignIn googleSignIn = GoogleSignIn();

      final GoogleSignInAccount? googleSignInAccount =
      await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        try {
          FirebaseFirestore firebase=FirebaseFirestore.instance;
          final UserCredential userCredential =
          await auth.signInWithCredential(credential);

            firebase.collection('Users').add({
              'username':user?.displayName,
              'uid':user?.uid,
              'email':user?.email,
              'imageUrl':user?.photoURL,
            });

            // currentUser.username=user?.displayName;
            // currentUser.userId=user!.uid;
            // currentUser.imageUrl=user.photoURL;
            // currentUser.email=user.email;




          SharedPreferences shared=await SharedPreferences.getInstance();
          user = userCredential.user;
          shared.setString('uid', user!.uid);
          if(shared.getString('uid')!=null){

          }else{

          }

        } on FirebaseAuthException catch (e) {
          if (e.code == 'account-exists-with-different-credential') {
            // ...
          } else if (e.code == 'invalid-credential') {
            // ...
          }
        } catch (e) {
          // ...
        }
      }
    }

    return user;
  }
}