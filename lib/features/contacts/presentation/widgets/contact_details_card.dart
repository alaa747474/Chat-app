
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactDetailsCard extends StatelessWidget {
  const ContactDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 10.w,),
      child: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            height: 40.h,
            child:Row(
              children: [
                Center(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage('https://pbs.twimg.com/media/FjyOjaTWQAA0b4M?format=jpg&name=large'),
                    radius: 22.r,
                  ),
                ),
                SizedBox(width: 10.w,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Contact Name',style: Theme.of(context).textTheme.headline4,),
                    Text('last seen recently',style: Theme.of(context).textTheme.headline5,),
                  ],
                )
              ],
            ) ,
          ),
          Padding(
            padding:  EdgeInsets.only(left: 60.w),
            child: Divider(thickness: 0.4,color: Theme.of(context).hintColor,),
          )
        ],
      ),
    );
  }
}