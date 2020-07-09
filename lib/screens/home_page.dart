import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodappui/theme.dart';
import 'package:foodappui/widgets/recommended_container.dart';
import 'package:foodappui/screens/detail_page.dart';
import 'package:foodappui/model.dart';
import '../widgets/food_container.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum FoodItems  {burger , pizza , milkshake }
FoodItems selectedItem;


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {

  var currentFood = foodModel[0].foodSpecialityOne;
  var currentSpecial = foodModel[0].foodSpecialityTwo;
  var currentImage = foodModel[0].foodImage;
  var currentFoodPrice = foodModel[0].sizeMPrice;
  int currentValue = 0;



  void functionality(FoodItems selectedFood , String foodName , String foodDetail , String imageAddress , int foodPrice , int value)
  {
    setState(() {
      selectedItem = selectedFood;
      currentFood = foodName;
      currentSpecial = foodDetail;
      currentImage = imageAddress;
      currentFoodPrice = foodPrice;
      currentValue = value;
    });
  }


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: backgroundColor,

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch ,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.08 , vertical: width * 0.08),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.menu),
                Row(
                  children: <Widget>[
                    Icon(Icons.location_on),
                   Text('Rajkot,',
                   style: displayOne,),
                    Text('India',
                    style: displayOne,),
                  ],
                ),
                CircleAvatar(
                  child: Text('H'),
                  backgroundColor: activeColor,
                )
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: width * 0.08 ,),
            child: Text('Online Food',
            style: displayTwo),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.08 ,),
            child: Row(
              children: <Widget>[
                Text('Delievery',
                style: displayThree,
                ),
                Icon(FontAwesomeIcons.pizzaSlice),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.08 , vertical: 0.03 * height),
            child: TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.search),
                hintText: 'Search',
                hintStyle: displayOne,
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey[400])
                )
              ),
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric( horizontal: width * 0.08),
            child: Row(
              children: <Widget>[
                FoodContainer(value: 0,
                  iconData: selectedItem == FoodItems.burger ? activeIconContainer : inactiveIconContainer,
                color: selectedItem == FoodItems.burger ? activeColor : inActiveColor,
                onPressed: (){
                  functionality(FoodItems.burger , foodModel[0].foodSpecialityOne , foodModel[0].foodSpecialityTwo , foodModel[0].foodImage , foodModel[0].sizeMPrice , 0);
                  },),
                SizedBox(width :width * 0.08),
                FoodContainer(value: 1,
                  iconData: selectedItem == FoodItems.pizza ? activeIconContainer : inactiveIconContainer,
                  color: selectedItem == FoodItems.pizza ? activeColor : inActiveColor,
                  onPressed: (){
                    functionality(FoodItems.pizza , foodModel[1].foodSpecialityOne , foodModel[1].foodSpecialityTwo , foodModel[1].foodImage , foodModel[1].sizeMPrice , 1);
                    },),
                SizedBox(width :width * 0.08),
                FoodContainer(value: 2,
                  iconData: selectedItem == FoodItems.milkshake ? activeIconContainer : inactiveIconContainer,
                  color: selectedItem == FoodItems.milkshake ? activeColor : inActiveColor,
                  onPressed: (){
                    functionality(FoodItems.milkshake , foodModel[2].foodSpecialityOne ,foodModel[2].foodSpecialityTwo , foodModel[2].foodImage , foodModel[2].sizeMPrice , 2);
                    },),

              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(left: width * 0.08 , top: 0.03 * height ,  ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Recommended',
                    style:displayFour),
               Padding(
                 padding:  EdgeInsets.only(right: 24),
                 child: MaterialButton(
                   minWidth: 0.5,
                   onPressed: (){
                     Navigator.push(context, PageRouteBuilder(pageBuilder:(context , animation , secanimation){
                       return DetailsPage(
                         value: currentValue,
                       );
                     },
                         transitionDuration: Duration(milliseconds: 1000),
                         transitionsBuilder: (context , animation , secanimation , child){
                         Animation animationCurve = CurvedAnimation(
                         parent: animation,
                        curve: Curves.bounceIn,
                        reverseCurve: Curves.elasticInOut,
                       );
                           return FadeTransition(
                             opacity: animationCurve,
                               child: child,
                           );
                         }
                     ),);

                   },
                   color: activeColor,
                   child: Icon(Icons.arrow_forward_ios,
                   size: 10,),
                 ),
               )
              ],
            )
          ),
          Expanded(
              child: RecommendedContainer(
                foodName: currentFood,
                foodCategory: currentSpecial,
                foodPrice: 'Rs.$currentFoodPrice',
                imageAddress: currentImage,
              ),
          ),
        ],
      ),
    );
  }
}

