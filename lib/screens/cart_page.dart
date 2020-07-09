import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodappui/theme.dart';

class CartPage extends StatelessWidget {

  final int billPrice;
  CartPage({this.billPrice});


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF757575),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30 , vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            CircleAvatar(
              backgroundColor: activeColor,
              child: Icon(
                Icons.shopping_cart,
                color: Colors.black,
                size: 90,
              ),
              radius: 80,
            ),
            SizedBox(height: 30,),
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 60,),
              child: Text('Rs. $billPrice',
              style: displayFour,),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: activeColor,
                  width: 3,
                )
              ),
            ),
            SizedBox(height: 15,),
            GestureDetector(
              onTap: (){},
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: activeColor,
                ),
                child: Text('Go to Payment method',
                style: displayOne),
              ),
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: activeColor,
                  width: 3),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text('Go back',
                style: displayOne,),
              ),
            )
          ],
        ),
      ),
    );
  }
}
