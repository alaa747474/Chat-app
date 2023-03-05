import 'package:chat_app/core/services/firestore_service.dart';
import 'package:chat_app/core/utils/service_locator.dart';
import 'package:chat_app/core/widgets/custom_sliver_app_bar.dart';
import 'package:chat_app/core/widgets/loading_indicator.dart';
import 'package:chat_app/features/contacts/business_logic/contacts_cubit/contacts_cubit.dart';
import 'package:chat_app/features/contacts/business_logic/logged_in_contacts_cubit/logged_in_contacts_cubit.dart';
import 'package:chat_app/features/contacts/data/repository/contacts_repository.dart';
import 'package:chat_app/features/contacts/presentation/widgets/contact_details_card.dart';
import 'package:chat_app/features/settings/data/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt.get<ContactsCubit>()..getContacts(),
        ),
        BlocProvider(
          create: (context) => LoggedInContactsCubit(
              ContactsRepository(FirestoreService(FirebaseFirestore.instance)))
            ..getUsers(),
        )
      ],
      child: Scaffold(
        body: BlocBuilder<LoggedInContactsCubit, LoggedInContactsState>(
          builder: (context, state) {
            if (state is LoggedInContactsLoaded) {
              List<UserModel> users = state.users;
              return CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  const CustomSliverAppBar(
                    title: 'Contacts',
                  ),
                  BlocBuilder<ContactsCubit, ContactsState>(
                    builder: (context, state) {
                      if (state is ContactsLoaded) {
                        List loggedInContacts = context
                            .read<LoggedInContactsCubit>()
                            .getListOfLoggedInContacts(
                                contacts: state.contacts, users: users);
                        return SliverPadding(
                          padding: EdgeInsets.only(top: 10.h),
                          sliver: SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                                return ContactDetailsCard(
                                  contactName: loggedInContacts[index].name,
                                  contactNumber:
                                      loggedInContacts[index].phoneNumber,
                                  contactImage:
                                      loggedInContacts[index].profilePic,
                                );
                              },
                              childCount: loggedInContacts.length,
                            ),
                          ),
                        );
                      }
                      return const SliverToBoxAdapter(
                        child: LoadingIndicator(),
                      );
                    },
                  )
                ],
              );
            }
            return LoadingIndicator();
          },
        ),
        backgroundColor: Theme.of(context).shadowColor,
      ),
    );
  }
}
