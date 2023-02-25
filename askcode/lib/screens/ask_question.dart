import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../utills.dart';

class AskQuestion extends StatelessWidget {
  AskQuestion({super.key});
  final TextEditingController _controllerdis = TextEditingController();
  final TextEditingController _controllertitle = TextEditingController();

  Future<String> getUserName() async {
    User? user = FirebaseAuth.instance.currentUser;
    final DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .get();
    final d = snapshot.data() as Map<String, dynamic>;
    final String name = d['username'];
    return name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
        child: Form(
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              children: [
                Icon(
                  size: 80,
                  color: Colors.grey,
                  Icons.question_answer_rounded,
                ),
                Text(
                  "Ask Your Question",
                  style: textStyle(25, Colors.grey, FontWeight.w700),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _controllertitle,
                  decoration: InputDecoration(
                    labelText: "Title",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.question_answer_rounded),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () => _controllertitle.clear(),
                    ),
                    hintText: 'Write Your Question',
                    // errorText: 'Please enter valid question',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: TextFormField(
                    controller: _controllerdis,
                    minLines: 1,
                    maxLines:
                        (MediaQuery.of(context).size.height * 0.3).round(),
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      labelText: "Description",
                      border: OutlineInputBorder(),
                      hintText: 'Write Your Question',
                      // errorText: 'Please enter valid question',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                          child: const Text(
                            'Ask',
                          ),
                          onPressed: () async {
                            String username = await getUserName();
                            print(username);
                            FirebaseFirestore.instance
                                .collection('questions')
                                .add({
                              'answerscount': 0,
                              'body': _controllerdis.text,
                              'title': _controllertitle.text,
                              'providedby': username,
                              'uploadedtime': DateTime.now(),
                              'qid': 1,
                              'gotanswer': [],
                            }).then((value) {
                              FirebaseFirestore.instance
                                  .collection('questions')
                                  .doc(value.id)
                                  .update({'qid': value.id});
                                  Navigator.pushReplacementNamed(context, '/dashboard');
                            });
                          }),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
