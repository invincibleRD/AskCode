import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utills.dart';

class SigninInput extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String _tags = '';
  String _username = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomLeft,
          colors: [
            Colors.deepOrangeAccent,
            Colors.purpleAccent,
            Colors.blueAccent
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 25, bottom: 5),
        child: Center(
          child: Container(
             height: MediaQuery.of(context).size.height*0.4,
             width: MediaQuery.of(context).size.width*0.8,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.white,
                    spreadRadius: 5,
                  )
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Set few things first",style: TextStyle(fontSize: 26,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
                const SizedBox(height: 15,),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      
                      children: [
                        TextFormField(
                          
                          decoration: InputDecoration(
                              labelText: 'Tags', hintText: 'python,Django,...',helperText: 'i.e. python, Django,...'),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some tags';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _tags = value!;
                          },
                        ),
                        SizedBox(height: 16.0),
                        TextFormField(
                          
                          decoration: InputDecoration(
                            labelText: 'Username',

                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter a username';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _username = value!;
                          },
                        ),
                        SizedBox(height: 20.0),
                        ElevatedButton(
                          onPressed: () 
                          {
                            if (_formKey.currentState!.validate()) {
                              _formKey.currentState!.save();
                              
                              print('Tags: $_tags');
                              print('Username: $_username');
                            
                              User? user = FirebaseAuth.instance.currentUser;
                              FirebaseFirestore.instance.collection('users').doc(user!.uid).update({'userTag':_tags,"username":_username});

                              FirebaseAuth.instance.signOut();
                            }
                          },
                          child: Text('Done'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
