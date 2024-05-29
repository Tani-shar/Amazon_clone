import 'package:amazon_clone_tutorial/constants/global_variables.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomButton({
    Key? key,
    required this.text,
    required this.onTap,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(text,style: TextStyle(color: GlobalVariables.backgroundColor),),
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: GlobalVariables.secondaryColor,
        minimumSize: const Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(0),
        )
        
      ),
    );
  }
}