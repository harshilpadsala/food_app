import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodappui/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class FoodContainer extends StatefulWidget {

  int value;
  Color color;
  Function onPressed ;
  Widget iconData;
  FoodContainer({@required this.value , @required this.color , @required this.onPressed , @required this.iconData});


  @override
  _FoodContainerState createState() => _FoodContainerState();
}

class _FoodContainerState extends State<FoodContainer> {
  int value;
  final Map<String , String> foodMap = {
    'burger' : 'assets/food_icons/burger.png',
    'pizza': 'assets/food_icons/pizza.png',
    'milkshake': 'assets/food_icons/milkshake.png',
  };




  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        height: 0.185 * height,
        width: 0.22 * width,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(25.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 3),
              blurRadius: 15,
            ),
          ],
        ),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: width * 15/440 , vertical: height * 15/950),
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                    color: Colors.grey[200]
                ),
              ),
              child: Image.asset(foodMap.values.elementAt(widget.value),
              scale: 18,),
            ),
            Text(foodMap.keys.elementAt(widget.value),
            style: displayOne,),
            SizedBox(height:height * 15/950 ,),
            widget.iconData,
            ],
        ),
      ),
    );
  }
}

