import 'package:flutter/material.dart';

import '../constants.dart';
import 'text_field_container.dart';

class RoundedNameField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String>? onChanged;
  final String? Function(String?)? validator;
  final TextEditingController? textEditingController;

  const RoundedNameField({
    Key? key,
    required this.hintText,
    this.icon = Icons.person,
    this.onChanged,
    this.validator,
    this.textEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        textCapitalization: TextCapitalization.sentences,
        keyboardType: TextInputType.name,
        controller: textEditingController,
        validator: validator,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
