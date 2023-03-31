import 'package:flutter/material.dart';

class Ticket extends StatelessWidget {
  const Ticket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Ticket', style: TextStyle(
          color: Colors.red
      ),),
    );
  }
}
