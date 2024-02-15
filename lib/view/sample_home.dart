import 'dart:io';

import 'package:flutter/material.dart';
import 'package:using_sharedpreferences/services/local_storage_services.dart';
import 'package:using_sharedpreferences/view/login_credintials.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () async {
                await LocalStorage().clearFunction();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserCredential(),
                    ));
              },
              icon: Icon(Icons.delete))
        ],
        leading: IconButton(
            onPressed: () {
              exit(0);
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
        centerTitle: true,
        title: const Text('Home'),
      ),
      body: const Center(
        child: Text('home page'),
      ),
    );
  }
}
