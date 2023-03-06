import 'package:chat_app/features/chat/business_logic/bloc/chat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.sendMessageOnPressed, required this.controller});
 final VoidCallback sendMessageOnPressed;
 final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc, ChatState>(
      builder: (context, state) {
        return Container(
          width: double.maxFinite,
          height: 50.h,
          color: Theme.of(context).primaryColor,
          child: Center(
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                   
                  },
                  icon: Icon(
                    Icons.attach_file_rounded,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                Flexible(
                  child: SizedBox(
                    height: 28.h,
                    child: TextField(
                      controller: controller,
                      cursorHeight: 23.h,
                      style: TextStyle(
                          color: Theme.of(context).primaryColorLight,
                          fontSize: 17.sp,
                          height: 1.2.h),
                      cursorWidth: 2.w,
                      cursorColor: Theme.of(context).focusColor,
                      decoration: InputDecoration(
                          hintStyle: Theme.of(context).textTheme.headline5,
                          hintText: 'Message',
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(200.r)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(200.r)),
                          filled: true,
                          fillColor: Theme.of(context).shadowColor),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: sendMessageOnPressed,
                    icon: const CircleAvatar(
                      child: Center(
                        child: Icon(Icons.arrow_upward),
                      ),
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}
