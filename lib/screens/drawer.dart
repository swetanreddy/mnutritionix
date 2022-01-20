import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mnutritionix/helpers/methods.dart';
import 'package:mnutritionix/screens/profileScreen.dart';

class mainDrawer extends StatelessWidget {

  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget> [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Column(
                children: <Widget> [
                  Container(
                    width: 100,
                    height: 100,
                    margin: const EdgeInsets.only(
                        top: 30,
                      bottom: 20
                    ),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: AssetImage("assets/images/th.jpg"),
                        fit: BoxFit.fill
                      ),
                    ),
                  ),
                  Text("${_auth.currentUser!.displayName}",
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.white
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text("${_auth.currentUser!.email}",
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Profile",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()));
            },
          ),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: null,
          ),
          ListTile(
            leading: const Icon(Icons.arrow_back),
            title: const Text("Log out",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              logOut(context);
            },
          ),
        ],
      )
    );
  }
}
