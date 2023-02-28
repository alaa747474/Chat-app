import 'package:chat_app/features/home/business_logic/cubit/home_cubit.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return BottomNavigationBar(
              onTap: (currentIndex) {
                context.read<HomeCubit>().changeIndex(currentIndex);
              },
              elevation: 0,
              backgroundColor: Theme.of(context).primaryColor.withOpacity(0.9),
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Theme.of(context).focusColor,
              unselectedItemColor: Theme.of(context).hintColor,
              selectedIconTheme: IconThemeData(size: 25.r),
              unselectedIconTheme: IconThemeData(size: 25.r),
              selectedFontSize: 11.sp,
              unselectedFontSize: 11.sp,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              currentIndex: context.read<HomeCubit>().selectedIndex,
              items: [
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(bottom: 5.h),
                      child: const Icon(Icons.account_circle),
                    ),
                    label: 'Contacts'),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(bottom: 5.h),
                      child: const Icon(Icons.chat),
                    ),
                    label: 'Chats'),
                BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.only(bottom: 5.h),
                      child: const Icon(Icons.settings),
                    ),
                    label: 'Settings'),
              ]);
        },
      
    );
  }
}
