
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CountryFlagNameRow extends StatelessWidget {
  const CountryFlagNameRow(
      {super.key,
      required this.onTap,
      required this.countryName,
      required this.countryCode});
  final VoidCallback onTap;
  final String countryName;
  final String countryCode;
  String generateCountryFlag(String countryCode) {
    String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
        (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
    return flag;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: Row(
          children: [
            Text(generateCountryFlag(countryCode)),
            SizedBox(
              width: 10.w,
            ),
            Text(
              countryName,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
