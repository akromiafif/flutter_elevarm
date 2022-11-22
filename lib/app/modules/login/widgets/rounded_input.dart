import 'package:flutter/material.dart';
import 'package:flutter_elevarm/app/data/constants.dart';
import 'package:flutter_elevarm/app/modules/login/widgets/input_container.dart';

class RoundedInput extends StatelessWidget {
  const RoundedInput({
    Key? key,
    required this.size,
    required this.icon,
    required this.hint,
    this.isSecure,
    required this.controller,
  }) : super(key: key);

  final Size size;
  final IconData icon;
  final String hint;
  final isSecure;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return InputContainer(
      child: TextField(
        controller: controller,
        obscureText: isSecure ? true : false,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(icon, color: kPrimaryColor),
          hintText: hint,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
