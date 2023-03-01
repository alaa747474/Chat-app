import 'package:chat_app/features/settings/presentation/widgets/settings_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [
          CircleAvatar(
            radius: 55.r,
            backgroundImage: NetworkImage(
                'https://pbs.twimg.com/media/FjyOjaTWQAA0b4M?format=jpg&name=large'),
          ),
          SizedBox(
            height: 5.h,
          ),
          Center(
              child: Text(
            'User Name',
            style: Theme.of(context).textTheme.headline1,
          )),
          SizedBox(height: 5.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '+201550034700',
                style: Theme.of(context).textTheme.headline5,
              ),
              SizedBox(
                width: 5.w,
              ),
              Text(
                '@alaa reda',
                style: Theme.of(context).textTheme.headline5,
              ),
            ],
          ),
          SizedBox(height: 20.h,),
          SettingsContainer(onTap: (){},icon: Icons.add_a_photo_outlined,text: 'Change Profile Photo'),
          SizedBox(height: 20.h,),
          SettingsContainer(onTap: (){},icon: Icons.bookmark_outlined,text: 'Saved Messages',editContainer: false,),
          SizedBox(height: 5.h,),
          SettingsContainer(onTap: (){},icon: Icons.lock,text: 'Sign Out',editContainer: false,),
        ],
      ),
    );
  }
}

