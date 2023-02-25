import 'package:askcode/screens/question_box_page.dart';
import 'package:askcode/screens/signin_input.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/circle_image.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // final String provideby,title,body;
  final arr = [];
  Future<String>? _pageContent;
  

  @override
  void initState()  {
    
    // TODO: implement initState
    
  _pageContent = _getPageContent();
    super.initState();
  }

  // getarr() async{
  //   await FirebaseFirestore.instance.collection('questions').orderBy('uploadedtime',descending: true).get().then((querySnapshot){
      
  //     querySnapshot.docs.forEach((element) {
  //       List temp = [];
  //       print("Hello");
  //       temp.add(element.data()['providedby']);
  //       temp.add(element.data()['title']);
  //       temp.add(element.data()['body']);
  //       arr.add(temp);
  //       });
  //       // print(temp);
  //     // arr.add(temp);
  //     // print(arr);
  //     // print(' ');
  //   });

    Future<String> _getPageContent() async {
    // Perform any asynchronous operations required to load the page content
    // ...
    await FirebaseFirestore.instance.collection('questions').orderBy('uploadedtime',descending: true).get().then((querySnapshot){
      
      querySnapshot.docs.forEach((element) {
        List temp = [];
        print("Hello");
        temp.add(element.data()['providedby']);
        temp.add(element.data()['title']);
        temp.add(element.data()['body']);
        arr.add(temp);
        });
        // print(temp);
      // arr.add(temp);
      // print(arr);
      // print(' ');
      print("array length ${arr.length}");
    });

    // Return the page content as a String
    return 'Page content';
  }


  @override
  Widget build(BuildContext context) {
    final User? user=FirebaseAuth.instance.currentUser;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    print("hel");
    return  Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: Column(
          children: [
            // The main content of the drawer goes here
            Container(
              margin: const EdgeInsets.only(top: 60),
              height: MediaQuery.of(context).size.height*0.2,
              decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          
          image: NetworkImage('https://th.bing.com/th/id/OIP.leRaZskYpTKA55a0St0tZgHaJa?pid=ImgDet&rs=1'),
          fit: BoxFit.cover,
        ),
      ),
            ),
            ListTile(
              title: Text('Profile',textAlign: TextAlign.center,),
            ),
            ListTile(
              title: Text('My Questions',textAlign: TextAlign.center,),
            ),
            ListTile(
              title: Text('My Answers',textAlign: TextAlign.center,),
            ),
            // This is the bottom widget of the drawer
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Container(
                  height: 50,
                  color: Colors.grey,
                  child: Center(
                    child: InkWell(
                      onTap: (){
                        // Navigator.pushReplacementNamed(context, '/signup');
                        FirebaseAuth.instance.signOut();
                      },
                      child: Text(
                        'Log Out',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body:
      StreamBuilder(
        stream: FirebaseFirestore.instance.collection('users').doc(user!.uid).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
        if(snapshot.data?.get('userTag')=='-'){
          // Navigator.pushReplacementNamed(context, '/signup');
        } 
      return Padding(
            padding: const EdgeInsets.only(top: 22),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            
                            _scaffoldKey.currentState?.openDrawer();
                            },
                          child: CircleImage(
                              imageUrl:
                                  'https://th.bing.com/th/id/OIP.leRaZskYpTKA55a0St0tZgHaJa?pid=ImgDet&rs=1',
                              size: 40.0)),
                      const Text(
                        "AskCode",
                        style: TextStyle(
                            fontSize: 30,
                            color: Color.fromARGB(255, 178, 116, 189)),
                      ),
                      IconButton(onPressed: () {
                        Navigator.pushNamed(context, '/askquestion');
                      }, icon: const Icon(Icons.search))
                    ],
                  ),
                ),
                Expanded(
                child: ListView.builder(itemCount: arr.length, itemBuilder: (context, index) {
                          print(index);
                          return QuestionContainer(data: [arr[index][0],arr[index][1],arr[index][2]]);
                          // return Text("dsfjs");
                        })
              )
              ],
            ),
          );
        }
      )
    );
  }
}