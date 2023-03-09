import 'package:chat_app/core/utils/service_locator.dart';
import 'package:chat_app/core/widgets/custom_sliver_app_bar.dart';
import 'package:chat_app/core/widgets/loading_indicator.dart';
import 'package:chat_app/features/chat/business_logic/bloc/chat_bloc.dart';
import 'package:chat_app/features/chat/data/model/chat_contact.dart';
import 'package:chat_app/features/chat/data/repository/chat_repository.dart';
import 'package:chat_app/features/chat/presentation/screens/messages_screen.dart';
import 'package:chat_app/features/chat/presentation/widgets/chat_contact_card.dart';
import 'package:chat_app/features/settings/data/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
     value: ChatBloc(getIt.get<ChatRepository>())..add(LoadChatContacts()),
      child: Scaffold(
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const CustomSliverAppBar(
              title: 'Chat',
            ),
            BlocBuilder<ChatBloc, ChatState>(
              builder: (context, state) {
                if (state is ChatContactsLoaded) {
                  return SliverPadding(
                    padding:EdgeInsets.only(top: 10.h) ,
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          ChatContact chatContact=state.chatContacts[index];
                          return InkWell(
                              onTap: () => Navigator.pushNamed(
                                  context, MessagesScreen.routeName,arguments: UserModel(chatContact.name, '', chatContact.profilePic, chatContact.phoneNumber, chatContact.contactId)),
                              child: ChatContactCard(
                                  image: chatContact.profilePic,
                                  contactName: chatContact.name,
                                  lastMessage:
                                      chatContact.lastMessage,
                                  timeSent: DateFormat.Hm().format(chatContact.timeSent).toString()));
                        },
                        childCount: state.chatContacts.length,
                      ),
                    ),
                  );
                }
                return const SliverToBoxAdapter(
                  child: LoadingIndicator(),
                );
              },
            ),
          ],
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}
