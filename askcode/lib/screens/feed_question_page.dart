import 'package:flutter/material.dart';

class FeedQuestion extends StatefulWidget {
  final String questionid;
  const FeedQuestion({super.key,required this.questionid});

  @override
  State<FeedQuestion> createState() => _FeedQuestionState(questionid);
}

class _FeedQuestionState extends State<FeedQuestion> {
  final String questionid;
  _FeedQuestionState(this.questionid);
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: Column(children: [
        Text("hello")
        
      ]),
    );
  }
}