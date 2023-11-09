import 'package:flight/util/style.dart';
import 'package:flutter/material.dart';

class MyRow extends StatelessWidget {
  String one;
  String two;
  String three;
  String four;
  String five;
  String six;
  MyRow(
      {super.key,
      required this.one,
      required this.two,
      required this.three,
      required this.four,
      required this.five,
      required this.six});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              one,
              style: MyStyle.light,
            ),
            Text(
              two,
              style: MyStyle.dark,
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              three,
              style: MyStyle.light,
            ),
            Text(
              four,
              style: MyStyle.dark,
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              five,
              style: MyStyle.light,
            ),
            Text(
              six,
              style: MyStyle.dark,
            ),
          ],
        ),
      ],
    );
  }
}
