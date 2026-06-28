import 'package:flutter/material.dart';
import 'screen/authentication/login.dart';
import 'screen/home/home.dart';
import 'screen/category/category.dart';
import 'screen/product/productdetail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductDetailsScreen(),
    );
  }
}

class expense_home extends StatelessWidget {
  const expense_home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Expense tracker")),
      body: Text("body content"),
    );
  }
}


