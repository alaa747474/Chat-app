import 'package:chat_app/core/widgets/custom_sliver_app_bar.dart';
import 'package:chat_app/core/widgets/loading_indicator.dart';
import 'package:chat_app/features/contacts/business_logic/cubit/contacts_cubit.dart';
import 'package:chat_app/features/contacts/data/repository/contacts_repository.dart';
import 'package:chat_app/features/contacts/presentation/widgets/contact_details_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ContactsCubit(ContactsRepository())..getContacts(),
      child: Scaffold(
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const CustomSliverAppBar(
              title: 'Contacts',
            ),
            BlocBuilder<ContactsCubit, ContactsState>(
              builder: (context, state) {
                if (state is ContactsLoaded) {
                  return SliverPadding(
                    padding: EdgeInsets.only(top: 10.h),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return ContactDetailsCard(
                            contactName: state.contacts[index].name.first,
                            contactNumber:
                                state.contacts[index].phones[0].number,
                            contactImage: null,
                          );
                        },
                        childCount: state.contacts.length,
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
        ),
        backgroundColor: Theme.of(context).shadowColor,
      ),
    );
  }
}
