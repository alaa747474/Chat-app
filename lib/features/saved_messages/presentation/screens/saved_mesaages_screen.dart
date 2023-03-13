import 'package:chat_app/core/widgets/loading_indicator.dart';
import 'package:chat_app/features/chat/presentation/widgets/sender_message_card.dart';
import 'package:chat_app/features/saved_messages/business_logic/bloc/saved_messages_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class SavedMessagesScreen extends StatelessWidget {
  const SavedMessagesScreen({super.key});
  static const String routeName = '/saved_messages_screen';
  @override
  Widget build(BuildContext context) {
    context.read<SavedMessagesBloc>().add(LoadSavedMessage());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Saved Messages',
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
      body: BlocBuilder<SavedMessagesBloc, SavedMessagesState>(
        builder: (context, state) {
          if (state is SavedMessagesLoaded) {
            return ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
              itemCount: state.messages.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.horizontal,
                  onDismissed: (direction) {
                    context
                        .read<SavedMessagesBloc>()
                        .add(RemoveMessage(state.messages[index]));
                  },
                  child: SenderMessageCard(
                      text: state.messages[index].message,
                      timeSent: DateFormat.Hm()
                          .format(state.messages[index].timeSent)),
                );
              },
            );
          }
          return const LoadingIndicator();
        },
      ),
    );
  }
}
