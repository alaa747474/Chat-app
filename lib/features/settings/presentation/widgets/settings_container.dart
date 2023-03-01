import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsContainer extends StatelessWidget {
  const SettingsContainer(
      {Key? key,
      required this.icon,
      required this.text,
      required this.onTap,
      this.editContainer = true})
      : super(key: key);
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  final bool editContainer;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        margin: EdgeInsets.symmetric(horizontal: 15.w),
        height: 35.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: Theme.of(context).primaryColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            editContainer
                ? Icon(
                    icon,
                    size: 25.r,
                    color: Theme.of(context).focusColor,
                  )
                : Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 5.h,
                    ),
                    padding: EdgeInsets.all(4.r),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: text == 'Sign Out'
                            ? Theme.of(context).hintColor
                            : Theme.of(context).focusColor),
                    child: Icon(
                      icon,
                      color: Colors.white,
                    ),
                  ),
            SizedBox(
              width: 15.w,
            ),
            Text(
              text,
              style: editContainer
                  ? Theme.of(context).textTheme.bodyText1
                  : Theme.of(context).textTheme.bodyText2,
            )
          ],
        ),
      ),
    );
  }
}
