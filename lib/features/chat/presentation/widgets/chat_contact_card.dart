import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatContactCard extends StatelessWidget {
  const ChatContactCard({super.key, required this.image, required this.contactName, required this.lastMessage, required this.timeSent});
 final String image;
  final String contactName;
   final String lastMessage;
    final String timeSent;
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
                     backgroundImage:  NetworkImage(image),
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
                      
                      Text(contactName,style: Theme.of(context).textTheme.titleLarge,),
                      SizedBox(height:2.h,),
                      Text(lastMessage,style: Theme.of(context).textTheme.titleMedium,),
                    ],
                  ),
                  Text(timeSent,style: Theme.of(context).textTheme.titleMedium)
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