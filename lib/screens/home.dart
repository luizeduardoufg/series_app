import 'package:flutter/material.dart';
import 'package:series/components/searchbar.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Página inicial'),
      ),
      body: SearchBar(),
    );
  }
}
