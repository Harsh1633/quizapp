import 'package:flutter/material.dart';


class InstructionField extends StatefulWidget {
  final String main_text,sub_text;
  final double rad_val;
  final Widget field;
  const InstructionField({super.key,
    required this.main_text,
    required this.sub_text,
    required this.rad_val, required this.field, });

  @override
  State<InstructionField> createState() => _InstructionFieldState();
}

class _InstructionFieldState extends State<InstructionField> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            height: 55,
            width: 55,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(widget.rad_val)
            ),
            child: widget.field,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.main_text,style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),),
            Text(widget.sub_text)
          ],
        )
      ],
    );
  }
}
