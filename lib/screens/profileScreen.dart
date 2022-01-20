import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        elevation: 0.0,

        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.pedal_bike)
          )
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: [],
      ),
    );
  }


}
