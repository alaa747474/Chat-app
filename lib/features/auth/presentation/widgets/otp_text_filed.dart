import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OTPTextField extends StatelessWidget {
  const OTPTextField({super.key,this.isLast=false, required this.controller, });
  final bool isLast;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 40.r,
        height: 80.r,
        child: TextFormField(
          controller: controller,
          showCursor: false,
          style: Theme.of(context).textTheme.headline4,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).focusColor,width: 2.5),
                borderRadius: BorderRadius.circular(15.r)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).hintColor,width: 1.5),
                borderRadius: BorderRadius.circular(15.r)),
          ),
          onChanged: (value) {
            if (value.length == 1) {
            isLast? null: FocusScope.of(context).nextFocus();
            }
          },
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,
          inputFormatters: [
            LengthLimitingTextInputFormatter(1),
            FilteringTextInputFormatter.digitsOnly
          ],
        ));
  }
}
