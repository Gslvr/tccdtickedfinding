import 'package:flutter/material.dart';

class FormButton extends StatefulWidget {
  const FormButton({Key? key,this.onTap, this.buttonText}) : super(key: key);
  final Function()? onTap;
  final String? buttonText;
  @override
  State<FormButton> createState() => _FormButtonState();
}

class _FormButtonState extends State<FormButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: widget.onTap, child: Text
      (widget.buttonText??"Gönder"));
  }
}
