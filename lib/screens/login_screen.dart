import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  // controllers
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  Future logIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _usernameController.text.trim(),
        password: _passwordController.text.trim());
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.3, 0.6, 0.9],
          colors: [
            Color.fromARGB(221, 20, 20, 20),
            Color.fromARGB(115, 239, 239, 239),
            Color.fromARGB(221, 20, 20, 20)
          ],
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
              child: Center(
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 50),
                    Text(
                      'Welcome',
                      style: TextStyle(
                        color: Color.fromARGB(224, 155, 238, 119),
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Icon(
                      Icons.android_rounded,
                      size: 100,
                      color: Color.fromARGB(224, 155, 238, 119),
                    ),
                    SizedBox(height: 40),
                    Text(
                      'Already an User ?',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(children: [
                      Text('USERNAME :',
                          style: TextStyle(
                              color: Color.fromARGB(255, 254, 255, 255),
                              fontWeight: FontWeight.bold)),
                    ]),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: SizedBox(height: 20),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          controller: _usernameController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your username',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(children: [
                      Text('PASSWORD :',
                          style: TextStyle(
                              color: Color.fromARGB(255, 254, 255, 255),
                              fontWeight: FontWeight.bold)),
                    ]),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: SizedBox(height: 20),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextField(
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Enter your password',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: logIn,
                      child: Container(
                        padding: EdgeInsets.all(25),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 87, 10, 4),
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                            'Log In',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text('NEW USER ? ',
                          style: TextStyle(
                              color: Color.fromARGB(255, 254, 255, 255),
                              fontWeight: FontWeight.bold,
                              fontSize: 15)),
                      Text(
                        'GET STARTED',
                        style: TextStyle(
                            color: Color.fromARGB(255, 52, 195, 238),
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      )
                    ])
                  ]),
            ),
            // Hello again
          ))),
    );
  }
}