import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProfileListItem extends StatelessWidget {
  String itemTitle;
  String itemTimeElapsed;
  String itemDescription;

  ProfileListItem({required this.itemTitle,required this.itemDescription, required this.itemTimeElapsed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*2.5/4,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                this.itemTitle,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
              Text(
                this.itemTimeElapsed,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400
                ),
              )
            ],
          ),
          SizedBox(
            height:5
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(this.itemDescription)
          ),
          SizedBox(
            height:10
          ),
          Divider()
        ],
      ),
    );
  }
}
