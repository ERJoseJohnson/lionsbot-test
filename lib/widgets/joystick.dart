import 'package:flutter/material.dart';

class Joystick extends StatefulWidget {
  const Joystick({ Key? key }) : super(key: key);

  @override
  _JoystickState createState() => _JoystickState();
}

class _JoystickState extends State<Joystick> {
  GlobalKey stackKey = GlobalKey();
  late double stackLeft;
  late double stackTop;
  double innerCircleX = 75;
  double innerCircleY = 75;

  @override
  void initState() {
    WidgetsBinding.instance!
        .addPostFrameCallback((_) {
        RenderObject? box = stackKey.currentContext!.findRenderObject();
            print(stackKey.currentContext!.findRenderObject());
            var translation = box?.getTransformTo(null).getTranslation();
            if (translation != null && box!.paintBounds != null) {
              stackTop = box.paintBounds.shift(Offset(translation.x, translation.y)).top;
              stackLeft = box.paintBounds.shift(Offset(translation.x, translation.y)).left;
            } else {
              print(null);
            }
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (dragDetails) {
        
        double posX = dragDetails.globalPosition.dx;
        double posY = dragDetails.globalPosition.dy;
        if (checkConstraints(posX, posY, stackTop, stackLeft)){
          setState(() {
            innerCircleX = dragDetails.globalPosition.dx - stackLeft - 75;
            innerCircleY = dragDetails.globalPosition.dy - stackTop - 75;
          });
        }
      },
      onPanEnd: (dragDetails){
        setState(() {
          innerCircleX = 75;
          innerCircleY = 75;
        });
      },
      child: Stack(
        key: stackKey,
        children: [
          Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              color: Color(0xFF072191),
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 4.0,
                style: BorderStyle.solid,
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 10.0,
                  blurRadius: 10.0,
                )
              ],
            ),
          ),
          Positioned(
            top: innerCircleY,
            left: innerCircleX,
            child: Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black26,
                width: 2.0,
                style: BorderStyle.solid,
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black87,
                  spreadRadius: 8,
                  blurRadius: 8,
                )
              ],
            ),
          ),
          )
        ],
      ),
    );
  }

  static bool checkConstraints(double posX, double posY, double topCoord, double leftCoord){
    double boundaryTopY = topCoord;
    double boundaryBottomY = topCoord + 300;
    double boundaryLeftX = leftCoord;
    double boundaryRightX = leftCoord + 300;

    if (posY+75 < boundaryBottomY && posY-75 > boundaryTopY && posX-75 > boundaryLeftX && posX+75 < boundaryRightX){
      return true;
    }
    else {
      return false;
    }

  }
}