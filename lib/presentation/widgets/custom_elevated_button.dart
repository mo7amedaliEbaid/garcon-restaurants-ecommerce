import 'package:flutter/material.dart';

Widget customElevatedButton({
  required double width,
  required double height,
  required Color color,
  required double borderRadius,
  required String text,
  required TextStyle textStyle,
  required void Function()? onPressed,
}) {
  return SizedBox(
    width: width,
    height: height,
    child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius))),
        child: Text(
          text,
          style: textStyle,
        )),
  );
}
