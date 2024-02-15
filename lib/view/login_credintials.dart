import 'dart:io';

import 'package:flutter/material.dart';
import 'package:using_sharedpreferences/model/usercrediential_model.dart';
import 'package:using_sharedpreferences/services/local_storage_services.dart';
import 'package:using_sharedpreferences/view/sample_home.dart';

class UserCredential extends StatefulWidget {
  const UserCredential({Key? key}) : super(key: key);

  @override
  _UserCredentialState createState() => _UserCredentialState();
}

class _UserCredentialState extends State<UserCredential> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              exit(0);
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
        centerTitle: true,
        title: const Text('User Credentials'),
      ),
      body: Center(
        child: SizedBox(
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  hintText: 'Enter your username',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        const BorderSide(color: Colors.blue, width: 2.0),
                  ),
                ),
              ),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide:
                        const BorderSide(color: Colors.blue, width: 2.0),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_passwordController.text.isNotEmpty &&
                      _usernameController.text.isNotEmpty) {
                    await LocalStorage().createUser(
                      UserCredentialModel(
                        username: _usernameController.text,
                        password: _passwordController.text,
                      ),
                    );
                    _usernameController.clear();
                    _passwordController.clear();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Home(),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text(
                          'Username or password cannot be empty',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
                  }
                },
                child: const Text('Login'),
              ),

              // ElevatedButton(
              //   onPressed: () async {
              //     // _createUser();

              //     await LocalStorage().createUser(
              //       UserCredentialModel(
              //         username: _usernameController.text,
              //         password: _passwordController.text,
              //       ),
              //     );
              //     _usernameController.clear();
              //     _passwordController.clear();
              //     if (_passwordController.text.isNotEmpty ||
              //         _usernameController.text.isNotEmpty) {
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //             builder: (context) => const Home(),
              //           ));
              //     } else {
              //       ScaffoldMessenger.of(context).showSnackBar(
              //         const SnackBar(
              //           backgroundColor: Colors.red,
              //           content: Text(
              //             'Username or password cannot be empty',
              //             style: TextStyle(color: Colors.white),
              //           ),
              //         ),
              //       );
              //     }
              //   },
              //   child: const Text('Login'),
              // ),
              ElevatedButton(
                onPressed: () async {
                  // _getUser();

                  final user = await LocalStorage().getUser();
                  if (user != null) {
                    setState(() {
                      _usernameController.text = user.username;
                      _passwordController.text = user.password;
                    });
                    print('User Found: ${user.username}');
                  } else {
                    print('User Not Found');
                  }
                },
                child: const Text('previous user'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // void _createUser() async {
  //   await LocalStorage().createUser(
  //     UserCredentialModel(
  //       username: _usernameController.text,
  //       password: _passwordController.text,
  //     ),
  //   );
  //   _usernameController.clear();
  //   _passwordController.clear();
  // }

  // void _getUser() async {
  //   final user = await LocalStorage().getUser();
  //   if (user != null) {
  //     setState(() {
  //       _usernameController.text = user.username;
  //       _passwordController.text = user.password;
  //     });
  //     print('User Found: ${user.username}');
  //   } else {
  //     print('User Not Found');
  //   }
  // }
}
