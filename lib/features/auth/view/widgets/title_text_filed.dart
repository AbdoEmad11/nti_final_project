import 'package:flutter/material.dart';

class TitleTextFiled extends StatefulWidget {
  const TitleTextFiled({
    super.key,
    required this.title,
    required this.myController,
  });

  final TextEditingController myController;
  final String title;

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
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
        ),
        SizedBox(height: 3),
        TextFormField(
          controller: widget.myController,
          obscureText: obscure2,
          decoration: InputDecoration(
            hintText: "Enter a ${widget.title}",
            hintStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
            prefixIcon: Icon(Icons.lock_outline_rounded),
            suffixIcon: IconButton(
              icon: Icon(obscure2 ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  obscure2 = !obscure2;
                });
              },
            ),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(18)),
          ),
        ),
      ],
    );
  }
}
