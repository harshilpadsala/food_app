import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const TextStyle displayOne = TextStyle(
  fontFamily: 'WorkSans',
);

const TextStyle displayOneG = TextStyle(
  fontFamily: 'WorkSans',
  color: Colors.grey,
);

const TextStyle displayTwo = TextStyle(
  fontFamily: 'WorkSans',
  fontSize: 35,
  fontWeight: FontWeight.w900,
);

const TextStyle displayThree = TextStyle(
  fontFamily: 'WorkSans',
  fontSize: 35,
);

const TextStyle displayFour = TextStyle(
  fontFamily: 'WorkSans',
  fontSize: 20,
  color: Colors.black,
);

const TextStyle displayFive = TextStyle(
  fontFamily: 'WorkSans',
  fontSize: 20,
  fontWeight: FontWeight.w900,
);


const Color backgroundColor = Colors.white;

final BoxDecoration profileContainerDecoration =  BoxDecoration(
  color: Colors.yellow,
  borderRadius: BorderRadius.circular(15.0),
);

final BoxDecoration bottomWhiteContainer = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(15),
      topRight: Radius.circular(15),
    ),
    boxShadow: [
      BoxShadow(
          color: Colors.black26,
          offset: Offset(3 , 3),
          blurRadius: 15
      )
    ]
);

final BoxDecoration bottomYellowContainer =  BoxDecoration(
  borderRadius: BorderRadius.circular(15),
  boxShadow: [BoxShadow(
      color: Colors.black12,
      offset: Offset(3 , 3),
      blurRadius: 10.0
  )],
  color: Color(0xFFF4B91A),
);


Color activeColor = Color(0xFFFDBD10);


Color inActiveColor = Colors.white;

IconData activeIcon = FontAwesomeIcons.arrowRight;

IconData inactiveIcon = FontAwesomeIcons.arrowCircleRight;

Widget activeIconContainer = Container(
  height: 25,
  width: 25,
  decoration: BoxDecoration(
    shape: BoxShape.circle,
    color: Colors.black,
  ),
  alignment: Alignment.center,
  child: Icon(Icons.arrow_forward_ios,
  color: Colors.white,
  size: 15,),
);

Widget inactiveIconContainer = Container(
  height: 25,
  width: 25,
  alignment: Alignment.center,
  decoration: BoxDecoration(
    shape: BoxShape.circle,
    color: Colors.white,
    border: Border.all(color: Colors.black),
  ),
  child:Icon(Icons.arrow_forward_ios,
    color: Colors.black,
    size: 15,) ,
);