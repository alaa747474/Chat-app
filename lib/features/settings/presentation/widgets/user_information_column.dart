import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserInformationColumn extends StatelessWidget {
  const UserInformationColumn(
      {super.key,
      required this.userName,
      required this.image,
      required this.email,
      required this.phoneNumber});
  final String userName;
  final String image;
  final String email;
  final String phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 55.r,
          backgroundImage: NetworkImage(image),
        ),
        SizedBox(
          height: 5.h,
        ),
        Center(
            child: Text(
          userName,
          style: Theme.of(context).textTheme.labelLarge,
        )),
        SizedBox(
          height: 5.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              phoneNumber,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(
              email,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ],
    );
  }
}
