import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lionsbot_test/widgets/joystick.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';


class RemotePage extends StatefulWidget {
  RemotePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _RemotePageState createState() => _RemotePageState();
}

class _RemotePageState extends State<RemotePage> {
  bool waterToggle = false;
  bool brushToggle = false;
  bool isStartMode = true;
  int robotSpeed = 0;

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
      body: SlidingUpPanel(
        maxHeight: 200,
        minHeight: 80,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40)
        ),
        color: Colors.blue,
        panel: Column(
          children: [
            SizedBox(
              height: 5,
            ),
            Container(
              height: 3,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                shape: BoxShape.rectangle,
                color: Colors.white
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Icon(
              Icons.settings_outlined,
              color: Colors.white,
              size: 24,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "SETTINGS",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15,0.0,15,0.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Text(
                      "Speed: ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                      )
                    ),
                    Text(
                      (robotSpeed).toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                      )
                    )
                  ],
                )
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Slider(
              min: 0,
              max: 100,
              activeColor: Color(0xFF00146b),
              inactiveColor: Colors.white,
              value: robotSpeed.toDouble(), 
              onChanged: (double newSpeed){
                setState(() {
                  robotSpeed = newSpeed.toInt();
                });
              }
            )
          ],
        ),
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
                Row(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Icon(
                        Icons.arrow_left_sharp,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Icon(
                            Icons.arrow_drop_up_sharp,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                    Joystick(),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Icon(
                            Icons.arrow_drop_down_sharp,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Icon(
                        Icons.arrow_right_sharp,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 60,
                  width: 300,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isStartMode = !isStartMode;
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: (isStartMode)?MaterialStateProperty.all<Color>(Colors.blue):MaterialStateProperty.all<Color>(Colors.red),
                    ),
                    child: Text(
                      (isStartMode)?"START":"STOP", 
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold
                      ),
                    )),
                ),
                SizedBox(
                  height: 50,
                )
              ],
            )
          ]
        ),
      ),
    );
  }
}