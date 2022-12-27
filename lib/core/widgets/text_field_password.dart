import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/colors.dart';
import '../constants/values.dart';
import 'default_spaces.dart';

class PasswordTextField extends StatefulWidget {
  final onChange;
  final inputFormatters;
  final keyboardType;
  final double radiusValue;
  final Color textColor;
  const PasswordTextField({
    required this.onChange,
    this.inputFormatters,
    this.keyboardType,
    this.radiusValue = 1,
    this.textColor = Colors.white,
  });

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(defaultRadiusValue * widget.radiusValue),
            border: Border.all(color: borderColor),
          ),
          child: Row(
            children: [
              getSpaceHorizontal(),
              Expanded(
                flex: 100,
                child: TextFormField(
                  onChanged: widget.onChange,
                  initialValue: '',
                  // textAlign: TextAlign.center,
                  style: const TextStyle(decoration: TextDecoration.none),
                  obscureText: hidePassword,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: 'Şifre',
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
              Expanded(
                flex: 20,
                child: IconButton(
                  onPressed: () {
                    hidePassword = !hidePassword;
                    setState(() {});
                  },
                  icon: Icon(
                    hidePassword ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
