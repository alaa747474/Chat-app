import 'package:chat_app/core/widgets/custom_search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.edit,
                    color: Theme.of(context).focusColor,
                  ))
            ],
            leading: TextButton(
                onPressed: () {},
                child: Text(
                  'Edit',
                  style: Theme.of(context).textTheme.bodyText1,
                )),
            backgroundColor: Theme.of(context).primaryColor,
            centerTitle: true,
            title:  Text(title),
            pinned: true,
            snap: false,
            floating: true,
            expandedHeight: 100.h,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    color: Colors.transparent,
                    height: 70,
                    width: double.maxFinite,
                    child:  Center(
                      child: SearchField(onChanged: (s){}, searchController: TextEditingController(), clearSearchMethod: (){}),
                    ),
                  ),
                ],
              ),
              collapseMode: CollapseMode.pin,
              centerTitle: true,
            ),
          );
  }
}