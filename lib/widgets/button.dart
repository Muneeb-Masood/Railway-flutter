import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget{
  final String text;
  final Function onPressed;

  CustomButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
      onPressed: () => onPressed(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
              
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
            
          ),
          child: Text(
            text,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
          ),),
      ),
    );
  }}