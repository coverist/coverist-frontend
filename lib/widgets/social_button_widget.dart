import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialButton extends StatelessWidget {
  final String name;
  final Function onPressed;
  final Color? buttonColor;
  final Color? iconColor;
  final double? iconSize;
  final bool? isMinSize;
  const SocialButton(
      {Key? key,
      required this.name,
      required this.onPressed,
      this.buttonColor,
      this.iconColor,
      this.iconSize,
      this.isMinSize})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // return FloatingActionButton(
    //   splashColor: Colors.white,
    //   mini: isMinSize ?? true,
    //   onPressed: onPressed as void Function()?,
    //   backgroundColor: buttonColor ?? Colors.black,
    //   child: Icon(
    //     FontAwesomeIcons.github,
    //     color: iconColor ?? Colors.white,
    //     size: iconSize,
    //   ),
    // );

    return IconButton(
        onPressed: onPressed as void Function()?,
        icon: Image.asset('assets/images/' + name + '.png', fit: BoxFit.fill),
        iconSize: 10);
  }
}
