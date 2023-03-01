import 'package:chat_app/core/widgets/custom_sliver_app_bar.dart';
import 'package:chat_app/features/contacts/presentation/widgets/contact_details_card.dart';
import 'package:flutter/material.dart';


class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
         const CustomSliverAppBar(title: 'Contacts',),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              
              (BuildContext context, int index) {
                return ContactDetailsCard();
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