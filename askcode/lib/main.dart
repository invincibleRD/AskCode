import 'package:askcode/controllers/authentication_controller.dart';
import 'package:askcode/screens/ask_question.dart';
import 'package:askcode/screens/dashboard_page.dart';
import 'package:askcode/screens/feed_question_page.dart';

import 'package:askcode/screens/loginscreen.dart';
import 'package:askcode/screens/signin_input.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Root(),
      routes: {
        '/signup':(context) => SigninInput(),
        '/askquestion':(context) => AskQuestion(),
        '/dashboard' :(context) => Dashboard(),
        // '/feedquestion':(context) => FeedQuestion(),
      },
    );
  }
}
class Root extends StatelessWidget {
  AuthController authController =Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      (){
        return authController.user.value ==null ? LoginScreen() : Dashboard();
      }
    );
  }
}


