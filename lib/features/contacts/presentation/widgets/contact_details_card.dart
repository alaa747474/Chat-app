import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactDetailsCard extends StatelessWidget {
  const ContactDetailsCard(
      {super.key,
      required this.contactName,
      required this.contactImage,
      required this.contactNumber});
  final String contactName;
  final String contactNumber;
  final String? contactImage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 10.w,
        
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            height: 40.h,
            child: Row(
              children: [
                Center(
                  child: CircleAvatar(
                    backgroundImage: contactImage == null
                        ? null
                        : NetworkImage(contactImage!),
                    radius: 22.r,
                    child: contactImage == null
                        ? Text(
                            contactName[0],
                            style: Theme.of(context).textTheme.labelSmall,
                          )
                        : null,
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      contactName,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: 2.h,)
,                    Text(
                      contactNumber,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 60.w),
            child: Divider(
              thickness: 0.4,
              color: Theme.of(context).hintColor,
            ),
          )
        ],
      ),
    );
  }
}
