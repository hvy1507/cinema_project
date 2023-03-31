import 'package:flutter/material.dart';

class Location extends StatelessWidget {
  const Location({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Location', style: TextStyle(
          color: Colors.red
      ),),
    );
  }
}
