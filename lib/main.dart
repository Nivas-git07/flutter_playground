import 'package:flutter/material.dart';

void main() {
  runApp(const expense_app());
}

class expense_app extends StatelessWidget {
  const expense_app({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const expense_home());
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
