import 'package:flutter/material.dart';
class SearchScreen extends StatelessWidget {
  static const routeName='/search';
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(child: Text('seach screen'),),
    );
  }

}
