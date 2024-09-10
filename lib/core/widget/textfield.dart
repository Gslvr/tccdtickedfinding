import 'package:flutter/material.dart';
class TextFieldForm extends StatefulWidget {
   TextFieldForm({Key? key,this.controller,this.onChange}) : super(key:
   key);
  final TextEditingController? controller;
  final Function(String)? onChange;

  @override
  State<TextFieldForm> createState() => _TextFieldFormState();
}

class _TextFieldFormState extends State<TextFieldForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),
      child: TextFormField(
        controller: widget.controller,
        onChanged: widget.onChange,
        decoration:  InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: Colors.red, width: 0)
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(color: Colors.green, width: 1)
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(color: Colors.red, width: 3)
          ),
          labelText: 'İstasyon Adı',
          suffix: const Icon(Icons.train),
          hintText: 'En az 2 karakter giriniz',
        ),
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Lütfen bir istasyon adı giriniz';
          }
          return null;
        },

      ),
    );
  }
}
