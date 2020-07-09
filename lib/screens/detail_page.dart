import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodappui/screens/cart_page.dart';
import 'package:foodappui/theme.dart';
import 'package:foodappui/widgets/container_builder.dart';
import 'package:foodappui/model.dart';
import 'package:foodappui/widgets/size_container.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum FoodSize {S , M ,L}


class DetailsPage extends StatefulWidget {





  final int value;
  DetailsPage({this.value});


  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {


   int numberOfItem = 1;
   FoodSize selectedFoodSize = FoodSize.M;

   int totalPrice = 20;
   int currentPrice;

   @override
  void initState() {
    super.initState();
    var  price = foodModel[widget.value].sizeMPrice ;
    currentPrice = price;
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 30 , right: 30 , top: 40, bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap : (){
                    Navigator.pop(context);
                  },
                  child: ContainerBuilder(
                    isText: false,
                    containerData: Icons.arrow_back_ios,
                  ),
                ),
                ContainerBuilder(
                  isText: false,
                  containerData: Icons.refresh,
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(foodModel[widget.value].foodName,
              style: displayThree,),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40 , vertical: 20,),
              child: Text(foodModel[widget.value].foodDescription,
              style: displayOne,)),
         Align(
           alignment: Alignment.center,
           child: Container(
             height: 280,
             width: 280,
             decoration: BoxDecoration(
                 shape: BoxShape.circle,
                 boxShadow: [
                   BoxShadow(
                     color: Colors.grey[350],
                   ),
                   BoxShadow(
                     color: Colors.white,
                     spreadRadius: -12,
                     blurRadius:12,
                   )
                 ]
             ),
             child: Image.asset(foodModel[widget.value].foodImage,
               height: 100,
               width: 100,),
           ),
         ),

            Expanded(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 35 , right: 35 , top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizeContainer(
                         size: 'S',
                          color: selectedFoodSize == FoodSize.S ? activeColor : inActiveColor,
                          onPressed: (){
                           setState(() {
                             selectedFoodSize = FoodSize.S;
                             currentPrice = foodModel[widget.value].sizeSPrice;
                           });
                          },
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top:  40,),
                          child:  SizeContainer(
                            size: 'M',
                            color: selectedFoodSize == FoodSize.M ? activeColor : inActiveColor,
                            onPressed: (){
                              setState(() {
                                selectedFoodSize = FoodSize.M;
                                currentPrice = foodModel[widget.value].sizeMPrice;
                              });
                            },
                          ),
                        ),
                        SizeContainer(
                          size: 'L',
                          color: selectedFoodSize == FoodSize.L ? activeColor : inActiveColor,
                          onPressed: (){
                            setState(() {
                              selectedFoodSize = FoodSize.L;
                              currentPrice = foodModel[widget.value].sizeLPrice;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding:  EdgeInsets.only(top: 20 , bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          AddRemoveButton(iconData: FontAwesomeIcons.plus,
                          function: (){
                            setState(() {
                              numberOfItem ++;
                            });
                          },),
                          Text(numberOfItem.toString()),
                          AddRemoveButton(iconData: FontAwesomeIcons.minus,
                          function: (){
                            setState(() {
                              numberOfItem == 0 ? null : numberOfItem--;
                            });
                          },)
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: 35),
                    child: Row(
                      children: <Widget>[
                      Container(
                        width: 80,
                        child: RichText(
                          text: TextSpan(
                            children: [TextSpan(
                              text: 'Price\n',
                              style: displayOneG,
                            ),
                              TextSpan(
                                text: 'Rs. ${numberOfItem * currentPrice}',
                                style:displayFour,
                              )
                            ]
                          ),
                        ),
                      ),
                        Expanded(
                          child: Container(
                            alignment: Alignment.bottomCenter,
                            margin: EdgeInsets.only(left: 40),
                            color: Color(0xFFFDBD10),
                            child: FlatButton.icon(
                                onPressed: (){
                                  showModalBottomSheet(context: context, builder: (context) => CartPage(
                                    billPrice: numberOfItem * currentPrice,
                                  ));
                                },
                                icon: Icon(Icons.shopping_cart),
                                label: Text('Go to Shopping',
                                style: displayOne,)),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0 , size.height/2);
    path.lineTo(size.width, size.height/2);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class AddRemoveButton extends StatelessWidget {

  final IconData iconData;
  final Function function;
  AddRemoveButton({this.iconData , this.function});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: CircleAvatar(
        backgroundColor: Color(0xFFFFEFC6),
        child: IconButton(
            icon: Icon(iconData,
            color: Colors.white,) ,
            onPressed: function,
        ),
      ),
    );
  }
}


