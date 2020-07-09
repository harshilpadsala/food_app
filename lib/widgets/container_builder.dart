import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodappui/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ContainerBuilder extends StatelessWidget {

  final  containerData;
  final bool isText;
  ContainerBuilder({this.containerData , this.isText});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 38,
      width: 38,
      child: isText ? Text(containerData,
      style: displayFour,) : Icon(containerData,
      size: 20,),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(3 , 3),
              blurRadius: 15,
            )
          ]
      ),
    );
  }
}