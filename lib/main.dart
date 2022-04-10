
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gamer_tag_app/src/ui/pages/auth/sign_in_page.dart';
import 'package:gamer_tag_app/src/ui/pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getvalue();
  }
  bool islogined=false;

  getvalue() async {
      SharedPreferences sharedPreferences=await SharedPreferences.getInstance();
      setState(() {



    islogined=  sharedPreferences.getBool('id')!;

      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.robotoMonoTextTheme(), //
        primarySwatch: Colors.blue,
      ),
      home:islogined==true?HomePage(): const SignInPage(),
    );
  }
}

