import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:producttracking_mobilev3/camera_page.dart';
import 'package:producttracking_mobilev3/user.dart';
import 'package:http/http.dart' as http;
import 'globals.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  User user = User("", "");
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                height: 700,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 10,
                          color: Colors.black,
                          offset: Offset(1, 5))
                    ],
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(80),
                        bottomRight: Radius.circular(0))),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(children: [
                    SizedBox(
                      height: 100,
                    ),
                    Text(
                      "Login",
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        fontSize: 50,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Username",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white),
                      ),
                    ),
                    TextFormField(
                      controller: TextEditingController(text: user.userName),
                      onChanged: (val) {
                        user.userName = val;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Username is empty';
                        }
                        return null;
                      },
                      style: TextStyle(fontSize: 30, color: Colors.white),
                      decoration: InputDecoration(
                        errorStyle: TextStyle(
                          fontSize: 20,
                          color: Colors.white
                        ),
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                    ),
                    Container(
                      height: 8,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Password",
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white),
                      ),
                    ),
                    TextFormField(
                      controller:
                          TextEditingController(text: user.userPassword),
                      onChanged: (val) {
                        user.userPassword = val;
                      },
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password is empty';
                        }
                        return null;
                      },
                      style: TextStyle(fontSize: 30, color: Colors.white),
                      decoration: InputDecoration(
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none)),
                    ),
                    Container(
                      height: 8,
                      color: Colors.white,
                    ),
                    SizedBox(
                      height: 30,
                    )
                  ]),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 70,
                width: 70,
                child: FloatingActionButton(
                  backgroundColor: Colors.blue,
                  onPressed: () {
                    
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CameraPage()));
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
