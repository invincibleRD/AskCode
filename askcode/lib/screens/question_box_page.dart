import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../widgets/circle_image.dart';

class QuestionContainer extends StatefulWidget {
  final List data;
  const QuestionContainer({super.key,required this.data});

  @override
  State<QuestionContainer> createState() => _QuestionContainerState(data);
}

class _QuestionContainerState extends State<QuestionContainer> {
  final List data;
  _QuestionContainerState(this.data);
  bool _isFirstLoad = true;
  
  
  @override
  Widget build(BuildContext context) {
    // print(data);
    // String third = data as String;
    String third = '${data[2]}';
    String body = "${third.substring(0,min(third.length,200))}.........";

    
    return  Container(
      margin: EdgeInsets.only(left: 15,right: 15,top: 5,bottom: 5),
      padding: EdgeInsets.only(top: 15,bottom: 15,right: 15, left: 15),
      decoration: BoxDecoration(
        color: Color.fromRGBO(94, 87, 87, 0.2),
        //  border: Border.all(
        //   // color: Color.fromRGBO(94, 87, 87, 1),
        //   width: 2.0,
        // ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
          topRight: Radius.circular(10),
          bottomLeft: Radius.circular(10)
        ),
      ),
      child: InkWell(
        onTap: (){
          // Navigator.pushNamed(context, '/feedquestion');
        },
        child: Column(
          children: [
            Row(
              children:[
                InkWell(
                  onTap: (){},
                  child: CircleImage(imageUrl: 'https://th.bing.com/th/id/OIP.leRaZskYpTKA55a0St0tZgHaJa?pid=ImgDet&rs=1',size: 25)),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: (){},
                  child: Text(data[0])),
              ]
            ),
            const SizedBox(
              height: 10,
            ),
            
            Container(
              alignment: Alignment.topLeft,
              child: Text(data[1],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,overflow: TextOverflow.fade),)),
            const SizedBox(
              height: 5,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(body))
          ],
        ),
      ),
    );
  }
}