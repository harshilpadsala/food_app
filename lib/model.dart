class FoodModel {

  String foodName;
  String foodSpecialityOne;
  String foodSpecialityTwo;
  String foodDescription;
  int sizeSPrice;
  int sizeMPrice;
  int sizeLPrice;
  String foodImage;

FoodModel({this.foodName ,
  this.foodSpecialityOne ,
  this.foodSpecialityTwo ,
  this.foodDescription,
  this.foodImage ,
  this.sizeSPrice,
  this.sizeMPrice,
  this.sizeLPrice,
});
}

List<FoodModel> foodModel = [
  FoodModel(
    foodName: 'Burger',
    foodSpecialityOne: 'Sunday Cheese Special',
    foodSpecialityTwo: 'Aloo Tiki Burger',
    foodImage: 'assets/burgers/burger1.png',
    foodDescription: 'Eat this burger and forgot all about past, future and even today',
    sizeSPrice : 30,
    sizeMPrice: 50,
    sizeLPrice: 60,

  ),
  FoodModel(
      foodName: 'Pizza',
      foodSpecialityOne: 'Sunday Pizza Special',
      foodSpecialityTwo: 'Paneer Masala Pizza',
      foodImage: 'assets/pizza/pizza1.png',
    foodDescription: 'Enjoy each slice of pizza engraved with spice and cheese',
      sizeSPrice : 90,
      sizeMPrice: 150,
      sizeLPrice: 300,
  ),
  FoodModel(
      foodName: 'Milkshake',
      foodSpecialityOne: 'Sunday Special Milkshake',
      foodSpecialityTwo: 'Choclate Milkshake',
      foodImage: 'assets/milkshake/milkshake1.png',
      foodDescription: 'This choclate shake will give your heart the warmth it had never experienced.',
      sizeSPrice : 90,
      sizeMPrice: 120,
      sizeLPrice: 150,
  )
];