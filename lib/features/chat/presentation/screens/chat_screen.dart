import 'package:chat_app/core/widgets/custom_sliver_app_bar.dart';
import 'package:chat_app/features/chat/presentation/widgets/chat_contact_card.dart';
import 'package:flutter/material.dart';


class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
         const CustomSliverAppBar(title: 'Chat',),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              
              (BuildContext context, int index) {
                return ChatContactCard();
              },
              childCount: 20,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}