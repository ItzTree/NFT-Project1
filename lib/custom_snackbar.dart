import 'package:flutter/material.dart';

import 'data/color_palette.dart';

class CustomSnackBar extends StatelessWidget {
  const CustomSnackBar({
    super.key,
    required this.snackBarText,
  });

  final String snackBarText;

  void showSnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: SnackBarContent(snackBarText: snackBarText),
      backgroundColor: Colors.white,
      behavior: SnackBarBehavior.floating,
      duration: Duration(seconds: 2),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: sscctalkPrimaryColor, width: 2),
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class SnackBarContent extends StatelessWidget {
  const SnackBarContent({
    Key? key,
    required this.snackBarText,
  }) : super(key: key);

  final String snackBarText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.check_circle_outline, color: successColor),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            snackBarText,
            style: TextStyle(color: Colors.black),
            overflow: TextOverflow.visible,
          ),
        ),
      ],
    );
  }
}
