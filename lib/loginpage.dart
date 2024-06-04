import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'model/nav.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _login() async {
    String username = _userController.text;
    String password = _passwordController.text;

    final CollectionReference users =
        FirebaseFirestore.instance.collection('dataloginakun');
    QuerySnapshot querySnapshot =
        await users.where('username', isEqualTo: username).get();

    if (querySnapshot.docs.isNotEmpty) {
      var userDoc = querySnapshot.docs.first.data() as Map<String, dynamic>;
      if (userDoc['password'] == password) {
        // Login successful
        print('Login successful');
        navToDashBoard(
            context); // Assuming this is the correct navigation method
      } else {
        // Incorrect password
        print('Incorrect password');
      }
    } else {
      // User not found
      print('User not found');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[50],
        body: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              SizedBox(height: 120),
              Text('Ikram Kasir Apps',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey[800])),
              SizedBox(height: 50),
              Container(
                  width: 300,
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3))
                      ]),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // User
                        Container(
                            width: 250,
                            height: 50,
                            margin: EdgeInsets.only(bottom: 20),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: TextFormField(
                                controller: _userController,
                                style: TextStyle(fontSize: 20),
                                decoration: InputDecoration(
                                    labelText: 'User',
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    border: InputBorder.none))),
                        // Password
                        Container(
                            width: 250,
                            height: 50,
                            margin: EdgeInsets.only(bottom: 20),
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: TextFormField(
                                controller: _passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                    labelText: 'Password',
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.never,
                                    border: InputBorder.none))),
                        // Login
                        GestureDetector(
                            onTap: () {
                              navToDashBoard(context);
                            },
                            child: Container(
                                width: 150,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: Colors.blueGrey[800],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Center(
                                    child: Text('Login',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white)))))
                      ]))
            ])));
  }
}
