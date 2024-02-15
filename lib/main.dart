import 'package:flutter/material.dart';
import 'package:using_sharedpreferences/model/usercrediential_model.dart';
import 'package:using_sharedpreferences/services/local_storage_services.dart';
import 'package:using_sharedpreferences/view/login_credintials.dart';
import 'package:using_sharedpreferences/view/sample_home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool hasData = await LocalStorage().isData();

  runApp(MyApp(
    hasData: hasData,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.hasData});
  final bool hasData;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: hasData ? const UserCredential() : Home(),
    );
  }
}
