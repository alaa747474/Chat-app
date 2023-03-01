import 'package:chat_app/core/widgets/custom_search_field.dart';
import 'package:chat_app/features/chat/presentation/widgets/custom_text_field.dart';
import 'package:chat_app/features/chat/presentation/widgets/reciver_message_card.dart';
import 'package:chat_app/features/chat/presentation/widgets/sender_message_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});
  static const String routeName = '/messages_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/background.png'),fit: BoxFit.cover,opacity: 0.25)
        ),
        height: double.maxFinite,
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount:50,
                itemBuilder:(context, index) {
                return index.isOdd?ReciverMessageCard():SenderMessageCard();
              },),
            ),
          CustomTextField()
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).focusColor,
          )),
      centerTitle: true,
      actions: [
        CircleAvatar(
          radius: 20.r,
        )
      ],
      title: Column(
        children: [
          Text(
            'User Name',
            style: Theme.of(context).textTheme.headline4,
          ),
          Text(
            'last seen',
            style: Theme.of(context).textTheme.headline5,
          )
        ],
      ),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
