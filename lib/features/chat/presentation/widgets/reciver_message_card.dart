
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReciverMessageCard extends StatelessWidget {
  const ReciverMessageCard({super.key, required this.text, required this.timeSent});
  final String text;
  final String timeSent;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 250.w),
        child: Container(
          margin: EdgeInsets.only(left: 5.h,bottom: 5.h),
          padding: EdgeInsets.all(7.r),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              color: Theme.of(context).hintColor.withOpacity(0.5)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(text),
               SizedBox(height: 5.h,),
              Text(timeSent,style: TextStyle(fontSize: 12.sp,color: Theme.of(context).primaryColorLight.withOpacity(0.3)))
            ],
          ),
        ),
      ),
    );
  }
}
