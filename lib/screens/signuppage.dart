

import 'package:flutter/material.dart';
import 'package:sqlitelogin/screens/loginScreen.dart';
import 'package:sqlitelogin/screens/registerform.dart';




class RegisterworkerScreen extends StatelessWidget {
  static const String id='register-screen';


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:NestedScrollView(
          headerSliverBuilder: (BuildContext context,bool innerBoxIsScrolled){
            return[
              SliverAppBar(
                title: Text('Registration '),

              )
            ];
          },
          body:  Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                  //  SopePicCard(),
                    SignupForm(),
                    Row(
                      children: [
                        MaterialButton(
                          padding: EdgeInsets.zero,
                          onPressed: (){
                            Navigator.pushAndRemoveUntil(context,  MaterialPageRoute(builder: (context)=>LoginScreen()),((route) =>false ));

                          },
                          child: RichText(
                            text: TextSpan(
                              text: '',
                              children: [
                                TextSpan(text:'Already have an account?',style:TextStyle(color: Colors.black54)),
                                TextSpan(text:'Login',style:TextStyle(fontWeight: FontWeight.bold,color: Colors.red)),

                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
