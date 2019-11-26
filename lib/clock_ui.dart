import 'dart:math';

import 'package:flutter/material.dart';

class ClockColumn extends StatelessWidget {
  final String binaryInteger;
  final String title;
  final Color color;
  final int rows;
  List bits;

  ClockColumn({
    this.binaryInteger,
    this.title,
    this.color,
    this.rows = 4,
  }) {
    bits = binaryInteger.split('');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        ...[
          Container(
            child: Text(
              title,
              style: Theme.of(context).textTheme.display1,
            ),
          )
        ],
        ...bits.asMap().entries.map((entry) {
          int idx = entry.key;
          String bit = entry.value;

          bool isActive = bit == '1';
          int binaryCellValue = pow(2, 3 - idx);

          return AnimatedContainer(
            duration: Duration(milliseconds: 475),
            curve: Curves.ease,
            height: 40,
            width: 30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              color: isActive
                  ? color
                  : idx < 4 - rows
                      ? Colors.white.withOpacity(0)
                      : Colors.white24,
            ),
            margin: EdgeInsets.all(4),
            child: Center(
              child: isActive
                  ? Text(
                      binaryCellValue.toString(),
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.4),
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  : Container(),
            ),
          );
        }),
        ...[
          Text(
            int.parse(binaryInteger, radix: 2).toString(),
            style: TextStyle(fontSize: 30, color: color),
          ),
          Container(
            child: Text(
              binaryInteger,
              style: TextStyle(
                fontSize: 16,
                color: color,
              ),
            ),
          ),
        ]
      ],
    );
  }
}
