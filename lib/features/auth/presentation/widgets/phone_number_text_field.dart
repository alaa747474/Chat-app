import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhoneNumberTextField extends StatelessWidget {
  const PhoneNumberTextField({super.key, required this.phoneCode, required this.controller});
  final String phoneCode;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Row(
        children: [
          Text('+$phoneCode'),
          SizedBox(
            width: 15.w,
          ),
          Flexible(
              child: TextField(
                
            inputFormatters: [LengthLimitingTextInputFormatter(10)],
            keyboardType: TextInputType.phone,
            style: Theme.of(context).textTheme.bodyMedium,
            controller: controller,
            decoration: InputDecoration.collapsed(
                hintText: '00 0000 0000',
                hintStyle: Theme.of(context).textTheme.titleMedium),
          ))
        ],
      ),
    );
  }
}
