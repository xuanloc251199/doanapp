import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:daoan6/values/colors.dart';
import 'package:daoan6/values/images.dart';

class NeuButtonWidget extends StatelessWidget {
  final Color? bgButton;
  final Color? shadowRB;
  final Color? shadowLT;
  final Color? blurColor;
  final Color? borderColor;
  final double? width;
  final double? height;
  final double? radius;
  final double? spreadRadius;
  final double? blurRadius;
  final Widget? child;
  final Function()? onPressed;
  final BoxShadow? boxShadow;
  final bool? isBorder;
  final bool? isBoxShadow;

  const NeuButtonWidget({
    Key? key,
    this.bgButton,
    this.width,
    this.height,
    this.radius,
    this.spreadRadius,
    this.child,
    this.onPressed,
    this.shadowRB,
    this.shadowLT,
    this.blurRadius,
    this.boxShadow,
    this.blurColor,
    this.isBorder,
    this.isBoxShadow,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width ?? 45,
        height: height ?? 45,
        decoration: BoxDecoration(
          color: bgButton ?? bgWhiteColor,
          border: isBorder == true
              ? Border.all(
                  color: borderColor ?? greyDarktColor,
                  width: 1,
                )
              : null,
          borderRadius: BorderRadius.circular(radius ?? 15),
          boxShadow: isBoxShadow == true
              ? [
                  BoxShadow(
                      color: Color(0xFFF6F7FD),
                      offset: Offset(15, 20),
                      blurRadius: blurRadius ?? 45,
                      spreadRadius: spreadRadius ?? 0.1),
                ]
              : null,
        ),
        child: child,
      ),
    );
  }
}
