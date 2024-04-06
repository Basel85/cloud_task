import 'package:flutter/material.dart';

class ColumnLocatedOnTheFirstBody extends StatelessWidget {
  final List<Widget> widgets;
  const ColumnLocatedOnTheFirstBody({super.key, required this.widgets});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: widgets
      ),
    );
  }
}
