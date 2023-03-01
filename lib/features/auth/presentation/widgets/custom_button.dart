import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onPressed});
final String text;
  
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r)
        ),
        
        elevation:0,
        backgroundColor: Theme.of(context).focusColor,
        fixedSize: Size(MediaQuery.of(context).size.width,40.h)
      ),
      onPressed: onPressed, child: Center(child: Text(text,style: Theme.of(context).textTheme.headline3 ,)));
  }
}