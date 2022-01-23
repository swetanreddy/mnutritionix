import 'package:flutter/material.dart';
import 'package:mnutritionix/screens/drawer.dart';

class Calculate extends StatefulWidget {
  String itemName;
  String totalFat;
  String servingWeightGrams;
  String protein;
  String sodium;
  String totalCarbohydrates;
  String cholesterol;
  String brandName;
  String calories;
  Calculate({Key? key,
    required this.itemName,
    required this.totalFat,
    required this.servingWeightGrams,
    required this.protein,
    required this.sodium,
    required this.totalCarbohydrates,
    required this.cholesterol,
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
  }

  @override
  Widget build(BuildContext context) {

    final primaryColor = Theme.of(context).primaryColor;
    final size = MediaQuery.of(context).size;
    final TextEditingController _quantity = TextEditingController();
    bool _isHave = false;
    String calories = "";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text("M-NutritioniX"),
      ),
      endDrawer: mainDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(widget.itemName,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20),
                ),
                SizedBox(height: size.height / 20),
                Text("Calories = " + widget.calories.toString(),
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20),
                ),
                SizedBox(height: size.height / 20),
                Container(
                  width: size.width,
                  alignment: Alignment.center,
                  child: quantityField(size, "Enter the quantity in grams",
                      Icons.food_bank_outlined, _quantity),
                ),
                const SizedBox(height: 5),
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      calories = ((double.parse(_quantity.text)*double.parse(widget.calories))/double.parse(widget.servingWeightGrams)).toString();
                      _isHave = true;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: primaryColor),
                    width: size.width / 2,
                    height: size.height / 15,
                    alignment: Alignment.center,
                    child: const Text('Calculate',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                ),
                // GestureDetector(
                //   onTap: () {
                //     print(_isHave.toString());
                //     setState(() {
                //       _isHave = true;
                //       calories = ((double.parse(_quantity.text)*double.parse(widget.calories))/double.parse(widget.servingWeightGrams)).toString();
                //     });
                //     print(_quantity.text.runtimeType);
                //     print(_quantity.text);
                //     print(calories);
                //     print(widget.calories.runtimeType);
                //     print(_quantity.text.toString().runtimeType);
                //     print("Calories = " + ((double.parse(_quantity.text)*double.parse(widget.calories))/double.parse(widget.servingWeightGrams)).toString());
                //     print("Protein = " + ((double.parse(_quantity.text)*double.parse(widget.protein))/double.parse(widget.servingWeightGrams)).toString());
                //     print("Total Carbohydrates = " + ((double.parse(_quantity.text)*double.parse(widget.totalCarbohydrates))/double.parse(widget.servingWeightGrams)).toString());
                //     print("Sodium = " + ((double.parse(_quantity.text)*double.parse(widget.sodium))/double.parse(widget.servingWeightGrams)).toString());
                //     print("Total Fat = " + ((double.parse(_quantity.text)*double.parse(widget.totalFat))/double.parse(widget.servingWeightGrams)).toString());
                //     print("Cholesterol = " + ((double.parse(_quantity.text)*double.parse(widget.cholesterol))/double.parse(widget.servingWeightGrams)).toString());
                //     print(_isHave.toString());
                //     },
                //   child: Container(
                //     decoration: BoxDecoration(
                //         borderRadius: BorderRadius.circular(10),
                //         color: primaryColor),
                //     width: size.width / 2,
                //     height: size.height / 15,
                //     alignment: Alignment.center,
                //     child: const Text(
                //       'Calculate',
                //       style: TextStyle(fontSize: 20, color: Colors.black),
                //     ),
                //   ),
                // ),
                const SizedBox(height: 35),
                _isHave == true ? Container(
                  width: size.width / 1.1,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.green, width: 3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Text("Calories = " + calories),
                      //Text("Calories = " + ((double.parse(_quantity.text)*double.parse(widget.calories))/double.parse(widget.servingWeightGrams)).toString()),
                      Text("Hiii"),
                      //Text("Calories = " + ((double.parse(_quantity.text)*double.parse(widget.calories))/double.parse(widget.servingWeightGrams)).toString()),
                      SizedBox(height: 5),
                      Text("Hii"),
                      SizedBox(height: 5),
                      Text("Hii"),
                      SizedBox(height: 5),
                      Text("Hii"),
                    ],
                  ),
                ) : Text(" "),
                //resultView(size, _quantity.text),
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
      child: TextField(
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

  Widget resultView(Size size, var quan) {
    return Container(
      width: size.width / 1.1,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.green, width: 3),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Text("Calories = " + ((double.parse(quan.toString())*double.parse(widget.calories))/double.parse(widget.servingWeightGrams)).toString()),
          // Text("Hii"),
          const SizedBox(height: 5),
          const Text("Hii"),
          const SizedBox(height: 5),
          const Text("Hii"),
          const SizedBox(height: 5),
          const Text("Hii"),
        ],
      ),
    );
  }
}
