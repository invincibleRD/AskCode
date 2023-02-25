import 'package:askcode/controllers/authentication_controller.dart';
import 'package:askcode/screens/signin_input.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utills.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomLeft,
        colors: [
          Colors.deepOrangeAccent,
          Colors.purpleAccent,
          Colors.blueAccent
        ],
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).viewInsets.top + 100),
              child: const Image(
                width: 200,
                height: 200,
                image: AssetImage('images/avatar.png'),
                fit: BoxFit.cover,
              ),
            ),
            const Spacer(),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(
                  left: 30, top: 30, right: 30, bottom: 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.white,
                      spreadRadius: 5,
                    )
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(top: 25, bottom: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Ask Coding",
                      style: textStyle(
                          25, const Color(0xff635C9B), FontWeight.w700),
                    ),
                    Text(
                      "Ask Anything",
                      style: textStyle(
                          25, const Color(0xff635C9B), FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Share your Problems",
                      style: textStyle(20, textColor, FontWeight.w700),
                    ),
                    Text(
                      "Get Soluntions in Hand",
                      style: textStyle(20, textColor, FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () => Get.find<AuthController>().login(),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 1.7,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.deepOrangeAccent.withOpacity(0.9),
                        ),
                        child: Center(
                          child: Text(
                            "Login",
                            style: textStyle(23, Colors.white, FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () => Get.find<AuthController>().login(),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2,
                        height: 35,
                        // decoration: BoxDecoration(
                        //   borderRadius: BorderRadius.circular(20),
                        //   color: Colors.deepOrangeAccent.withOpacity(0.9),
                        // ),
                        child: Center(
                          child: Text(
                            "Dont have account",
                            style: textStyle(11, Colors.black, FontWeight.w700),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
