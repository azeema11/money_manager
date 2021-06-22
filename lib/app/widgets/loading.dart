import 'package:flutter/material.dart';

class Loading extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation(Colors.grey[800]),
      ),
    );
  }
}