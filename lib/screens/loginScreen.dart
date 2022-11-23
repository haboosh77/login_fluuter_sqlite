
// import 'dart:convert';

// import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqlitelogin/screens/comHelper.dart';
import 'package:sqlitelogin/screens/database/dbHelper.dart';
import 'package:sqlitelogin/screens/doctorlist.dart';
import 'package:sqlitelogin/screens/gettextformfeld.dart';
import 'package:sqlitelogin/screens/mainScreen.dart';
import 'package:sqlitelogin/screens/signuppage.dart';

import 'database/usermodel.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart'as http;

// import '../mainscreen/mainscreen.dart';dart
// import 'login_pres.dart';



class LoginScreen extends StatefulWidget {
  static const String id='login-screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  final _formkey=GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  final _conUserId = TextEditingController();
  final _conPassword = TextEditingController();

  var dbHelper;

  bool vis=true;


  String? errorText;
  bool validate=false;
  bool circuler=false;


  @override
  void initState() {
    super.initState();
    dbHelper = DbHelper();
  }

  login() async {
    String uid = _conUserId.text;
    String passwd = _conPassword.text;

    if (uid.isEmpty) {
      alertDialog(context, "Please Enter User ID");
    } else if (passwd.isEmpty) {
      alertDialog(context, "Please Enter Password");
    } else {
      await dbHelper.getLoginUser(uid, passwd).then((userData) {
        if (userData != null) {
          setSP(userData).whenComplete(() {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => MassengerListPage()),
                    (Route<dynamic> route) => false);
          });
        } else {
          alertDialog(context, "Error: User Not Found");
        }
      }).catchError((error) {
        print(error);
        alertDialog(context, "Error: Login Fail");
      });
    }
  }
  Future setSP(UserModel user) async {
   final SharedPreferences sp = await _pref;

    sp.setString("user_id", user.user_id!);
    sp.setString("user_name", user.user_name!);
    sp.setString("email", user.email!);
    sp.setString("password", user.password!);
  }

  @override
  Widget build(BuildContext context) {
   // final _authData=Provider.of<AuthworkerProvider>(context);
    return Scaffold(

        key: scaffoldKey,
        body:SingleChildScrollView(
          child: Stack(children: [
            // Positioned(
            //     top:0,
            //     child: SvgPicture.asset(
            //       'assets/images/top.svg',
            //       width: 400,
            //       height: 250,
            //     )),
            Container(
              alignment:Alignment.center ,
              child: Form(
                key:_formkey,
                child: Column(
                    mainAxisAlignment:MainAxisAlignment.start,
                    crossAxisAlignment:CrossAxisAlignment.center,
                    children: [
                      SizedBox(height:200),
                      // Text("Sign In",style:GoogleFonts.pacifico(
                      //     fontWeight: FontWeight.bold,fontSize: 50,
                      //     color: Colors.blue
                      // )),
                      SizedBox(height:10),
                      getTextFormField(
                        IsObscureText: false,
                          controller: _conUserId,
                          icon: Icons.person,
                          hintName: 'User ID'),

                      getTextFormField(
                        controller: _conPassword,
                        icon: Icons.lock,
                        hintName: 'Password',
                        IsObscureText: true,
                      ),
                      Divider(
                        height: 30,
                        thickness: 2,
                      ),
                      Text("Forgot  Password....",style:TextStyle(color:Colors.red,fontWeight: FontWeight.bold)),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          height: 50,
                          width: 400,
                          child: ElevatedButton(

                            onPressed: login,
                            child:circuler?CircularProgressIndicator(): Text("Sign In",
                              style:TextStyle(color: Colors.white))
                            ,
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.teal.shade100,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))

                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(65,20,0,0),
                        child:
                        Row(
                          children: [

                            Text("NOT have Account ?",
                              style:TextStyle(color:Colors.black,fontWeight: FontWeight.bold ),
                            ),
                            SizedBox(width: 10,),
                            InkWell(
                              onTap: (){
                                Navigator.pushReplacement(context, new MaterialPageRoute(builder: (context)=>RegisterworkerScreen()));
                              },
                              child: Text("SignUp ..",
                                style:TextStyle(color:Colors.blue,fontWeight: FontWeight.bold )

                                ,),
                            )

                          ],
                        ),
                      )
                    ]
                ),
              ),
            )
          ],
          ),
        )
    );
  }


}