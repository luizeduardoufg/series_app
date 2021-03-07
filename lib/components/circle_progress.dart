import 'package:flutter/material.dart';

class CircleProgressBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Loading'),
          SizedBox(
            height: 10,
          ),
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}
