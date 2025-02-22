import 'package:firebase_core/firebase_core.dart';
import 'package:firebasecrud/view/homepage/homescreen.dart';
import 'package:firebasecrud/view_model/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => EmployeeProvider()),
      ],
      child: MaterialApp(home: Homescreen(), debugShowCheckedModeBanner: false),
    );
  }
}
