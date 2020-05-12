import 'package:flutter/material.dart';
import 'package:lojavirtualapp/models/user_model.dart';
import 'package:lojavirtualapp/screens/home_screen.dart';
import 'package:scoped_model/scoped_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
        child: MaterialApp(
        title: 'Loja Virtual',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          primaryColor: Color.fromARGB(255,154,18, 179),
        ),
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
