import 'package:flutter/material.dart';
import '../constants/values.dart';

class InkwellButton extends StatelessWidget {
  final void Function()? onTap;
  final Widget child;
  final RoundedRectangleBorder? shape;
  final BoxDecoration? decoration;
  final double? elevation;
  const InkwellButton({Key? key, required this.child, required this.onTap, this.shape, this.decoration, this.elevation}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAlias,
      shape: shape ?? const RoundedRectangleBorder(borderRadius: defaultRadius),
      elevation: elevation ?? 2.0,
      child: Ink(
        decoration: decoration ?? const BoxDecoration(borderRadius: defaultRadius),
        child: InkWell(
          onTap: onTap,
          child: child,
        ),
      ),
    );
  }
}
