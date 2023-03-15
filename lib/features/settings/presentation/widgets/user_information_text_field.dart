import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserInformationTextField extends StatelessWidget {
  const UserInformationTextField({super.key, required this.hintText, required this.controller});
 final String hintText;
 final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      margin: EdgeInsets.symmetric(horizontal: 15.h),
      child: TextFormField(
        controller: controller,
        cursorHeight: 23.h,
        style: TextStyle(
            color: Theme.of(context).primaryColorLight, fontSize: 15.sp, height: 1.h),
        cursorWidth: 2.w,
        cursorColor: Theme.of(context).focusColor,
       // textAlign: TextAlign.center,
        decoration: InputDecoration(
            hintStyle: Theme.of(context)
                .textTheme
                .titleMedium,
            hintText: hintText,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10.r)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10.r)),
            filled: true,
            fillColor: Theme.of(context).primaryColor),
      ),
    );
  }
}