import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mnutritionix/helpers/methods.dart';
import 'package:mnutritionix/screens/profileScreen.dart';

class mainDrawer extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
            children: <Widget>[
              Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  color: Theme.of(context).primaryColor,
                  child: Center(
                      child: Column(
                        children: <Widget>[
                          DrawerHeader(
                            child: Column(
                              children: [
                                Text("${_auth.currentUser!.displayName}",
                                  style: const TextStyle(color: Colors.white, fontSize: 25),
                                ),
                                const SizedBox(height: 5),
                                Text("${_auth.currentUser!.email}",
                                  style: const TextStyle(color: Colors.white, fontSize: 25),
                                ),
                              ],
                            ),
                            decoration: const BoxDecoration(
                              color: Colors.green,
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage('assets/images/th.jpg'),
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfileScreen()));
                },
              ),
              const ListTile(
                leading: Icon(Icons.settings),
                title: Text(
                  "Settings",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                onTap: null,
              ),
              ListTile(
                leading: const Icon(Icons.arrow_back),
                title: const Text(
                  "Log out",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                onTap: () {
                  logOut(context);
                },
              ),
            ],
          )))
    ]));
  }
}
