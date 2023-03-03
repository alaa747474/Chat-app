import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PhoneNumberHintText extends StatelessWidget {
  const PhoneNumberHintText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      child: Row(
        children: [
          const Text('+20'),
          SizedBox(
            width: 10.w,
          ),
          Text(
            '00 0000 0000',
            style: Theme.of(context).textTheme.headline5,
          ),
        ],
      ),
    );
  }
}
