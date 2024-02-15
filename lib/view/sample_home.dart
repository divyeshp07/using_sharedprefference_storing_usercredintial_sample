import 'dart:io';

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
