import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchField extends StatelessWidget {
  const SearchField(
      {super.key,
      required this.onChanged,
      required this.searchController,
      required this.clearSearchMethod});
  final void Function(String)? onChanged;
  final TextEditingController searchController;
  final VoidCallback clearSearchMethod;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.h,
      margin: EdgeInsets.symmetric(horizontal: 15.h),
      child: TextFormField(
        controller: searchController,
        onChanged: onChanged,
        cursorHeight: 23.h,
        style: TextStyle(
            color: Theme.of(context).shadowColor, fontSize: 20.sp, height: 1.h),
        cursorWidth: 2.w,
        cursorColor: Theme.of(context).focusColor,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            hintStyle: Theme.of(context)
                .textTheme
                .headline5,
            hintText: 'Search',
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10.r)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10.r)),
            filled: true,
            fillColor: Theme.of(context).shadowColor),
      ),
    );
  }
}
