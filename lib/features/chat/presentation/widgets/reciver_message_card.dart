
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class ReciverMessageCard extends StatelessWidget {
  const ReciverMessageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 250.w),
        child: Container(
          padding: EdgeInsets.all(7.r),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.r),
              color: Theme.of(context).hintColor.withOpacity(0.5)),
          child: Text('aaaaadfsdfsdfdsf'),
        ),
      ),
    );
  }
}
