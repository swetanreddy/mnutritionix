import 'package:flutter/material.dart';
import 'package:mnutritionix/models/item.dart';
import 'package:mnutritionix/models/itemAPI.dart';
import 'package:mnutritionix/screens/drawer.dart';
import 'package:mnutritionix/screens/searchResults.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final TextEditingController _name = TextEditingController();



  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('M-NutritioninX'),
      ),
      endDrawer: mainDrawer(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Find the Best\nHealth for You',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(height: size.height / 20),
              Container(
                width: size.width,
                alignment: Alignment.center,
                child: field(size, "Enter the food name",
                    Icons.food_bank_outlined, _name),
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => SearchResults(Name: _name.text)));
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: primaryColor),
                  width: size.width / 2,
                  height: size.height / 15,
                  alignment: Alignment.center,
                  child: const Text(
                    'Search',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget field(
      Size size, String hintText, IconData icon, TextEditingController cont) {
    return Container(
      height: size.height / 10,
      width: size.width / 1.1,
      child: TextFormField(
        controller: cont,
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
