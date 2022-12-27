import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/values.dart';

Widget getTextField(
  String title,
  Function(String) onChanged, {
  borderRadius = 1.0,
  maxLines = 1,
  obscureText = false,
  inputFormatters = null,
  keyboardType = null,
  initialValue = '',
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        '$title',
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
      const SizedBox(height: 4),
      Container(
        padding: defaultPadding / 4,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(defaultRadiusValue * borderRadius),
          border: Border.all(color: borderColor),
        ),
        child: TextFormField(
          onChanged: onChanged,
          initialValue: initialValue,
          style: const TextStyle(decoration: TextDecoration.none),
          maxLines: maxLines,
          obscureText: obscureText,
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            isDense: true,
            contentPadding: EdgeInsets.all(8),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    ],
  );
}
