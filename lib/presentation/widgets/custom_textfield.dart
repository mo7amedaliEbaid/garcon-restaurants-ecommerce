import 'package:flutter/material.dart';
import 'package:garcon/core/core.dart';

import '../../configs/configs.dart';

Widget customTextField(
    {required String labelText,
    Widget? prefix,
    String? Function(String?)? validator,
    void Function(String)? onChanged,
    required TextEditingController controller}) {
  return TextFormField(
    autovalidateMode: AutovalidateMode.onUserInteraction,
    validator: validator,
    controller: controller,
    onChanged: onChanged,
    style: AppText.b2b,
    decoration: InputDecoration(
      errorMaxLines: 3,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey.withOpacity(.5),
        ),
        borderRadius: BorderRadius.circular(
          AppDimensions.normalize(4),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: AppColors.deepRed),
        borderRadius: BorderRadius.circular(
          AppDimensions.normalize(4),
        ),
      ),
      contentPadding: Space.all(1, .5),
      border: const OutlineInputBorder(),
      labelText: labelText,
      prefixIcon: prefix,
      prefixIconConstraints: BoxConstraints(
        maxHeight: AppDimensions.normalize(12),
      ),
    ),
  );
}
