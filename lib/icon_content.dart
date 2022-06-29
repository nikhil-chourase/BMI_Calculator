import 'package:flutter/material.dart';
import 'constants.dart';

class iconContent extends StatelessWidget {

  iconContent(this.icon,this.write);
  final IconData icon;
  final String write;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(height: 10.0,),
        Text(
          write,
          style: kLabelTextStyle,
        ),
      ],
    );
  }
}
