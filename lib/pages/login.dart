import 'package:flutter/material.dart';
import 'package:lionsbot_test/constants.dart';


class LoginPage extends StatefulWidget {
  LoginPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool showPassword = false;

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
        title: Text("Log In",style: TextStyle(
          color: Colors.white,
          fontSize: 40),),
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
                    padding: EdgeInsets.all(10),
                    // height: 200,
                    child: new TextField(
                      controller: this._emailController,
                      decoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0),
                          )
                        ),
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.grey),
                        fillColor: Colors.white),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: new TextField(
                      controller: this._passwordController,
                      obscureText: !showPassword,
                      decoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0),
                          )
                        ),
                        // labelText: 'Password',
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.grey),
                        fillColor: Colors.white,
                        suffixIcon: TextButton(
                          onPressed: () { 
                            print("Toggle password");
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                          child: Text(
                            (showPassword)?"Hide":"Show"
                          ),
                        ),
                      ),
                    ),
                  ),
                  
                ],
              ),
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
                              if (_emailController.text == hardCodedEmail && _passwordController.text == hardCodedPassword){
                                _emailController.clear();
                                _passwordController.clear();
                                Navigator.pushNamed(context, "/profile");
                              } 
                              else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Invalid password or email! Try again."))
                                );
                                _emailController.clear();
                                _passwordController.clear();
                              }
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
