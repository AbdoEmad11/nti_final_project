import 'package:flutter/material.dart';
import 'package:nti_final_project/core/theme/context_theme_extension.dart';

class TitleTextFiled extends StatefulWidget {
  const TitleTextFiled({
    super.key,
    required this.title,
    required this.myController,
    this.validator,
  });

  final TextEditingController myController;
  final String title;
  final String? Function(String?)? validator;

  @override
  State<TitleTextFiled> createState() => _TitleTextFiledState();
}

class _TitleTextFiledState extends State<TitleTextFiled> {
  bool obscure1 = true;
  bool obscure2 = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 17,
            color: context.appTheme.textPrimary,
          ),
        ),
        SizedBox(height: 3),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: widget.validator,
          controller: widget.myController,
          obscureText: obscure2,
          decoration: InputDecoration(
            hintText: "Enter a ${widget.title}",
            hintStyle: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: context.appTheme.textSecondary,
            ),
            prefixIcon: Icon(
              Icons.lock_outline_rounded,
              color: context.appTheme.textSecondary,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                obscure2 ? Icons.visibility_off : Icons.visibility,
                color: context.appTheme.textSecondary,
              ),
              onPressed: () {
                setState(() {
                  obscure2 = !obscure2;
                });
              },
            ),
            filled: true,
            fillColor: context.appTheme.inputFill,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(color: context.appTheme.border),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(color: context.appTheme.border),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide(color: context.appTheme.primary),
            ),
          ),
        ),
      ],
    );
  }
}
