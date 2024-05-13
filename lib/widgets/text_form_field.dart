import 'package:flutter/material.dart';

class TFF extends StatelessWidget {
  final TextEditingController controller;
  final dynamic validator;
  final String hintText;
  final TextInputType keyboardType;
  final dynamic onTap;
  final dynamic inputFormatters;
  final dynamic textInputAction;
  final dynamic textCapitalization;
  final bool obscure;
  final dynamic onSaved;
  final bool focus;

  const TFF({
    super.key,
    required this.controller,
    this.validator,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.onTap,
    this.inputFormatters,
    this.textInputAction = TextInputAction.next,
    this.textCapitalization = TextCapitalization.none,
    this.obscure = false,
    this.onSaved,
    this.focus = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 25,
        right: 25,
        top: 12,
      ),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.blue[100],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: TextFormField(
            controller: controller,
            validator: validator,
            obscureText: obscure,
            autofocus: focus,
            onSaved: onSaved,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 12,
              ),
            ),
            textInputAction: textInputAction,
            keyboardType: keyboardType,
            onTap: onTap,
            inputFormatters: inputFormatters,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            textCapitalization: textCapitalization,
          ),
        ),
      ),
    );
  }
}