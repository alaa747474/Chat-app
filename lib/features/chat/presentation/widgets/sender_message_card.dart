import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SenderMessageCard extends StatelessWidget {
  const SenderMessageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 250.w
        ),
        child: Container(
          padding: EdgeInsets.all(7.r),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            color: Theme.of(context).focusColor.withOpacity(0.7)
          ),
          child: Text('aaaaaaaaaaaaaaaaaassssssa'),
        ),
      ),
    );
  }
}