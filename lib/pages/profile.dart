import 'package:flutter/material.dart';
import 'package:lionsbot_test/constants.dart';
import 'package:lionsbot_test/models/achievement.dart';
import 'package:lionsbot_test/models/user.dart';
import 'package:lionsbot_test/pages/profileListItem.dart';
import 'package:lionsbot_test/widgets/profile_picture.dart';


class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late User _currentUser;
  bool _pointsMode = true;
  late List<Achievement> _listToDisplay;

  @override
  void initState() {
    _currentUser = User(username: "John Doe", cleaningHours: 13, badgesList: constantBadgesList, pointsList: constantPointsList);
    _listToDisplay = this._currentUser.pointsList;
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
        centerTitle: true,
        title: Text("Profile",style: TextStyle(
          color: Colors.white,
          fontSize: 40),),
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
                  ProfilePicture(),
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
                          onPressed: () {
                            setState(() {
                              _pointsMode = true;
                              _listToDisplay = _currentUser.pointsList;
                            });
                          }, 
                          child: Text(
                            "Points",
                            style: TextStyle(
                              fontSize: 18,
                              color: this._pointsMode?Colors.blue:Colors.grey,
                            ),
                          )
                        ),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              _pointsMode = false;
                              _listToDisplay = _currentUser.badgesList;
                            });
                          }, 
                          child: Text(
                            "Badges",
                            style: TextStyle(
                              fontSize: 18,
                              color: this._pointsMode?Colors.grey:Colors.blue,
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
                        itemCount: this._listToDisplay.length,
                        itemBuilder: (context, int index){
                          return ProfileListItem(
                            itemTitle: this._listToDisplay[index].itemTitle, 
                            itemDescription: this._listToDisplay[index].itemDescription, 
                            itemTimeElapsed: this._listToDisplay[index].itemTimeElapsed
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