import 'package:chat_app/core/utils/service_locator.dart';
import 'package:chat_app/core/utils/utils.dart';
import 'package:chat_app/core/widgets/loading_indicator.dart';
import 'package:chat_app/features/chat/business_logic/bloc/chat_bloc.dart';
import 'package:chat_app/features/chat/data/model/chat_contact.dart';
import 'package:chat_app/features/chat/presentation/widgets/custom_text_field.dart';
import 'package:chat_app/features/chat/presentation/widgets/reciver_message_card.dart';
import 'package:chat_app/features/chat/presentation/widgets/sender_message_card.dart';
import 'package:chat_app/features/contacts/business_logic/logged_in_contacts_cubit/logged_in_contacts_cubit.dart';
import 'package:chat_app/features/saved_messages/business_logic/bloc/saved_messages_bloc.dart';
import 'package:chat_app/features/settings/data/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key, required this.reviverUser});
  static const String routeName = '/messages_screen';
  final UserModel reviverUser;

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  final TextEditingController messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    if (!context.read<ChatBloc>().isClosed) {
      context.read<ChatBloc>().add(LoadMessages(widget.reviverUser.uid));
    }
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }

  scrollToLastIndex() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt.get<LoggedInContactsCubit>()..getUsers(),
      child: Scaffold(
        appBar: buildAppBar(context, widget.reviverUser.name,
            widget.reviverUser.phoneNumber, widget.reviverUser.profilePic),
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.cover,
                  opacity: 0.25)),
          height: double.maxFinite,
          child: BlocBuilder<ChatBloc, ChatState>(
            builder: (context, state) {
              if (state is MessagesLoaded) {
                scrollToLastIndex();
                return Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        controller: _scrollController,
                        itemCount: state.messages.length,
                        itemBuilder: (context, index) {
                          return state.messages[index].senderUid !=
                                  FirebaseAuth.instance.currentUser!.uid
                              ?  InkWell(
                                    onLongPress: () {
                                      showCustomAlertDialog(context, () {
                                        context.read<SavedMessagesBloc>().add(
                                            SaveMessage(
                                                state.messages[index].messageId,
                                                state.messages[index]));
                                      });
                                    },
                                    onTap: null,
                                    child: ReciverMessageCard(
                                      timeSent: DateFormat.Hm().format(
                                          state.messages[index].timeSent),
                                      text: state.messages[index].message,
                                    ),
                                  
                                )
                              : InkWell(
                                onLongPress: () {
                                      showCustomAlertDialog(context, () {
                                        context.read<SavedMessagesBloc>().add(
                                            SaveMessage(
                                                state.messages[index].messageId,
                                                state.messages[index]));
                                      });
                                    },
                                    onTap: null,
                                child: SenderMessageCard(
                                    timeSent: DateFormat.Hm()
                                        .format(state.messages[index].timeSent),
                                    text: state.messages[index].message),
                              );
                        },
                      ),
                    ),
                    BlocBuilder<ChatBloc, ChatState>(
                      builder: (context, state) {
                        return CustomTextField(
                          sendMessageOnPressed: () {
                            if (!context.read<ChatBloc>().isClosed) {
                              UserModel currentUser = context
                                  .read<LoggedInContactsCubit>()
                                  .getCurrentUserData();
                              context.read<ChatBloc>().add(SendMessage(
                                  messageController.text,
                                  widget.reviverUser.uid));
                              ChatContact senderChatContact = ChatContact(
                                  contactId: widget.reviverUser.uid,
                                  phoneNumber: widget.reviverUser.phoneNumber,
                                  name: widget.reviverUser.name,
                                  profilePic: widget.reviverUser.profilePic,
                                  timeSent: DateTime.now(),
                                  lastMessage: messageController.text);
                              ChatContact reciverChatContact = ChatContact(
                                  contactId: currentUser.uid,
                                  phoneNumber: currentUser.phoneNumber,
                                  name: currentUser.name,
                                  profilePic: currentUser.profilePic,
                                  timeSent: DateTime.now(),
                                  lastMessage: messageController.text);
                              context.read<ChatBloc>().add(SaveChatContact(
                                  widget.reviverUser.uid,
                                  senderChatContact,
                                  reciverChatContact));
                            }
                            scrollToLastIndex();
                          },
                          controller: messageController,
                        );
                      },
                    )
                  ],
                );
              }
              return const LoadingIndicator();
            },
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(
      BuildContext context, String userName, String phone, String image) {
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
          backgroundImage: NetworkImage(image),
          radius: 20.r,
        )
      ],
      title: Column(
        children: [
          Text(
            userName,
            style: Theme.of(context).textTheme.headline4,
          ),
          Text(
            phone,
            style: Theme.of(context).textTheme.headline5,
          )
        ],
      ),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
