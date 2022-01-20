import 'package:flutter/material.dart';
import 'package:mnutritionix/screens/drawer.dart';

class Calculate extends StatefulWidget {
  String itemName;
  String totalFat;
  String servingWeightGrams;
  String protein;
  String sodium;
  String totalCarbohydrates;
  String cholestrol;
  String brandName;
  String calories;
  Calculate({Key? key,
    required this.itemName,
    required this.totalFat,
    required this.servingWeightGrams,
    required this.protein,
    required this.sodium,
    required this.totalCarbohydrates,
    required this.cholestrol,
    required this.brandName,
    required this.calories}) : super(key: key);


  @override
  _CalculateState createState() => _CalculateState();
}

class _CalculateState extends State<Calculate> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.itemName.toString() + "hiiiii");
  }

  @override
  Widget build(BuildContext context) {

    final primaryColor = Theme.of(context).primaryColor;
    final size = MediaQuery.of(context).size;
    final TextEditingController _quantity = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("M-NutritioniX"),
      ),
      endDrawer: mainDrawer(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Text(widget.itemName,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(height: size.height / 20),
              Container(
                width: size.width,
                alignment: Alignment.center,
                child: quantityField(size, "Enter the quantity in grams",
                    Icons.food_bank_outlined, _quantity),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget quantityField(
      Size size, String hintText, IconData icon, TextEditingController cont) {
    return Container(
      height: size.height / 10,
      width: size.width / 1.1,
      child: TextFormField(
        controller: cont,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
