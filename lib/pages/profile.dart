import 'package:flutter/material.dart';
import 'package:lionsbot_test/constants.dart';
import 'package:lionsbot_test/models/achievement.dart';
import 'package:lionsbot_test/models/user.dart';
import 'package:lionsbot_test/pages/profileListItem.dart';


class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late User _currentUser;

  @override
  void initState() {
    _currentUser = User(username: "John Doe", cleaningHours: 13, badgesList: constantBadgesList, pointsList: constantPointsList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: TextButton(
          child: Text(
            "Home",
            style: TextStyle(
              color: Colors.white, 
              ),
          ),
          onPressed: () {
            print("Go home");
          },
        ),
        title: Center(
          child: Text("Profile",style: TextStyle(
            color: Colors.white,
            fontSize: 40),),
        ),
        actions: [
          TextButton(
            onPressed: (){}, 
            child: TextButton(
              child: 
                Text(
                "Logout",
                style: TextStyle(
                  color: Colors.white
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).popUntil(ModalRoute.withName('/'));
                },
              ) 
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height/3.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.png"),
                fit: BoxFit.cover),
            ),
          ),
          Positioned(
            child: Align(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  SizedBox(
                  height: 150
                ),
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    // color: Colors.white,
                    child: ClipOval(
                      child: Material(
                        color: Colors.transparent,
                        child: Ink.image(
                          image: AssetImage("assets/JohnDoe.jpeg"),
                          fit: BoxFit.cover,
                          width: 128,
                          height: 128,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    this._currentUser.username,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ), 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Cleaning Hours:",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        this._currentUser.cleaningHours.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width*3/4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50)
                      ),
                      border: Border.all(
                        color: Colors.grey
                      )
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () {}, 
                          child: Text(
                            "Points",
                            style: TextStyle(
                              fontSize: 18
                            ),
                          )
                        ),
                        TextButton(
                          onPressed: () {}, 
                          child: Text(
                            "Badges",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey
                            ),
                          )
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ScrollConfiguration(
                      behavior: MyScrollBehavior(),
                      child: ListView.builder(
                        padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width/8,
                          right: MediaQuery.of(context).size.width/8
                        ),
                        itemCount: this._currentUser.pointsList.length,
                        itemBuilder: (context, int index){
                          return ProfileListItem(
                            itemTitle: this._currentUser.pointsList[index].itemTitle, 
                            itemDescription: this._currentUser.pointsList[index].itemDescription, 
                            itemTimeElapsed: this._currentUser.pointsList[index].itemTimeElapsed
                          );
                        }
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ]
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: Colors.blue,
        unselectedLabelStyle: TextStyle(color: Colors.blue),
        onTap: (int index){
          if (index == 4){
            print("going to remote");
            Navigator.of(context).pushNamed('/remote');
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person),
            label: "Profile" 
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message_sharp),
            label: "Messages" 
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.android),
            label: "Robot" 
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings),
            label: "Settings" 
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.phone_android_sharp),
            label: "Remote" 
          ),
        ],
      ),
    );
  }
}

class MyScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}