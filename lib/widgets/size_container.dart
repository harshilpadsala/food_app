import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SizeContainer extends StatelessWidget{

  String size;
  Color color;
  Function onPressed;
  SizeContainer({this.size , this.color , this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(size),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 15,
            )
          ]
        ),
      ),
    );
  }
}