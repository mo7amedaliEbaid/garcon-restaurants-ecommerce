import 'package:flutter/material.dart';

Future<void> filterBottomSheet(BuildContext context) async {
  return showModalBottomSheet(
      context: context,
      builder: (BuildContext contex) {
        return const SizedBox.shrink();
      });
}
