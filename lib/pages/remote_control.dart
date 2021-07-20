import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lionsbot_test/widgets/joystick.dart';


class RemotePage extends StatefulWidget {
  RemotePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _RemotePageState createState() => _RemotePageState();
}

class _RemotePageState extends State<RemotePage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool waterToggle = false;
  bool brushToggle = false;

  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Remote Control",
            style: TextStyle(
            color: Colors.white,
            fontSize: 40,
            fontWeight: FontWeight.bold),
          ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: (){
            Navigator.of(context).popUntil(ModalRoute.withName('/profile'));
          },
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.png"),
                fit: BoxFit.cover),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: <Widget>[
                  Container(
                    height: 150,
                  ),
                  Container(
                    height: 50,
                    width: 350,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          style: BorderStyle.solid,
                          color: Colors.white
                        ),
                        bottom: BorderSide(
                          style: BorderStyle.solid,
                          color: Colors.white
                        ), 
                      )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.water_rounded,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10
                        ),
                        Text(
                          "WATER",
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                        SizedBox(
                          width: 10
                        ),
                        GestureDetector(
                          onTap: (){
                              setState(() {
                                this.waterToggle= !this.waterToggle;
                              });
                          },
                          child: Container(
                            padding: EdgeInsets.zero,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(100)
                            ),
                            child: CupertinoSwitch(
                              activeColor: Colors.lightBlue,
                              value: this.waterToggle, 
                              onChanged: (bool value) {
                                setState(() {
                                  this.waterToggle = value;
                                });
                              },
                            ),
                          ),
                        ),
                        VerticalDivider(
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10
                        ),
                        Icon(
                          Icons.brush, 
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 10
                        ),
                        Text(
                          "BRUSH",
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                        SizedBox(
                          width: 10
                        ),
                        GestureDetector(
                          onTap: (){
                              setState(() {
                                this.brushToggle= !this.brushToggle;
                              });
                          },
                          child: Container(
                            padding: EdgeInsets.zero,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.circular(100)
                            ),
                            child: CupertinoSwitch(
                              activeColor: Colors.lightBlue,
                              value: this.brushToggle, 
                              onChanged: (bool value) {
                                setState(() {
                                  this.brushToggle = value;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Joystick(),
              // Stack(
              //   children: [
              //     Container(
              //       width: MediaQuery.of(context).size.width/1.5,
              //       height: MediaQuery.of(context).size.width/1.5,
              //       decoration: BoxDecoration(
              //         // borderRadius: BorderRadius.circular(100),
              //         color: Color(0xFF003366),
              //         shape: BoxShape.circle,
                      
              //       ),
              //     ),
              //     Container(
              //       width: MediaQuery.of(context).size.width/1.5-80,
              //       height: MediaQuery.of(context).size.width/1.5-80,
              //       decoration: BoxDecoration(
              //         // borderRadius: BorderRadius.circular(100),
              //         color: Colors.blue,
              //         shape: BoxShape.circle,
              //         boxShadow: <BoxShadow>[
              //           BoxShadow(
              //             color: Colors.black12,
              //             spreadRadius: 8.0,
              //             blurRadius: 8.0,
              //           )
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
              Column(
                children: [
                  Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          // padding: EdgeInsets.all(10),
                          width: Size.infinite.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.blue,
                            border: Border(),
                          ),
                          child: TextButton(
                            onPressed: (){
                              Navigator.pushNamed(context, "/profile");
                            },
                            child: Text(
                              "Log In",
                              style: TextStyle(color: Colors.white),
                            ),
                            ),
                        ),
                      ),
                      TextButton(
                        onPressed: (){}, 
                        child: Text("Forgot your password?")
                      ),
                ],
              ),
            ],
          )
        ]
      ),
    );
  }
}