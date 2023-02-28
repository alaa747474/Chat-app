import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatContactCard extends StatelessWidget {
  const ChatContactCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 10.w,),
      child: Column(
        children: [
          SizedBox(
            width: double.maxFinite,
            height: 55.h,
            child:Row(
              children: [
                Center(
                  child: CircleAvatar(
                     backgroundImage: NetworkImage('https://pbs.twimg.com/media/FjyOjaTWQAA0b4M?format=jpg&name=large'),
                    radius: 30.r,
                  ),
                ),
                SizedBox(width: 10.w,),
               Expanded(
                 child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      Text('Contact Name',style: Theme.of(context).textTheme.headline4,),
                      SizedBox(height:2.h,),
                      Text('last seen recently',style: Theme.of(context).textTheme.headline5,),
                    ],
                  ),
                  Text('9:02 pm',style: Theme.of(context).textTheme.headline5)
                  ],
                 ),
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