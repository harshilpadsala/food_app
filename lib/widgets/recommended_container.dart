import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:foodappui/theme.dart';

class RecommendedContainer extends StatefulWidget{

  final String foodName;
  final String foodCategory;
  final String foodPrice;
  final String imageAddress;

  RecommendedContainer({
   this.foodName,
   this.foodPrice,
   this.foodCategory,
    this.imageAddress
});

  @override
  _RecommendedContainerState createState() => _RecommendedContainerState();
}

class _RecommendedContainerState extends State<RecommendedContainer> {

  @override
  Widget build(BuildContext context) {


    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Stack(
      fit: StackFit.expand,
      children:
      [

        Container(
          color: Colors.white,
          padding: EdgeInsets.only(top: width * 0.15),
          child: Container(
              margin: EdgeInsets.symmetric(horizontal: width * 0.08),
              decoration: bottomWhiteContainer,
              child: Padding(
                padding: EdgeInsets.only(left: width * 0.06  , right: width * 0.06 ,  top: width * 0.06  ),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        decoration:bottomYellowContainer,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical:width * 0.06),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("${widget.foodName}\n${widget.foodCategory}",
                            style: displayOne,),
                          Text('${widget.foodPrice}',
                            style: displayOne,),
                        ],
                      ),
                    )
                  ],
                ),
              )
          ),
        ),
        Positioned(
          top: height * 10/950,
          left: 50.0 * width / 440,
          right: 50.0 * width /440,
          child: Image.asset(widget.imageAddress,
            height: height * 250/950,
            width:  width * 300/440,
          ),
        ),
      ],
    );
  }
}