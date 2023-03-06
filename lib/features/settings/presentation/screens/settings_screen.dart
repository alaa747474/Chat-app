import 'package:chat_app/core/utils/service_locator.dart';
import 'package:chat_app/core/widgets/loading_indicator.dart';
import 'package:chat_app/features/auth/business_logic/sign_in_cubit/sign_in_cubit.dart';
import 'package:chat_app/features/contacts/business_logic/logged_in_contacts_cubit/logged_in_contacts_cubit.dart';
import 'package:chat_app/features/settings/presentation/widgets/settings_container.dart';
import 'package:chat_app/features/settings/presentation/widgets/user_information_column.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: getIt.get<SignInCubit>(),
          ),
          BlocProvider.value(
            value: getIt.get<LoggedInContactsCubit>()..getUsers(),
          ),
        ],
        child: ListView(
          shrinkWrap: true,
          children: [
            BlocBuilder<LoggedInContactsCubit, LoggedInContactsState>(
              builder: (context, state) {
                if (state is LoggedInContactsLoaded) {
                  var userInformation = state.users
                      .where((element) =>
                          element.uid == FirebaseAuth.instance.currentUser!.uid)
                      .toList();
                  return UserInformationColumn(
                      userName: userInformation[0].name,
                      image: userInformation[0].profilePic,
                      email: userInformation[0].email,
                      phoneNumber: userInformation[0].phoneNumber);
                }
                return const LoadingIndicator();
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            SettingsContainer(
                onTap: () {},
                icon: Icons.add_a_photo_outlined,
                text: 'Change Profile Photo'),
            SizedBox(
              height: 20.h,
            ),
            SettingsContainer(
              onTap: () {},
              icon: Icons.bookmark_outlined,
              text: 'Saved Messages',
              editContainer: false,
            ),
            SizedBox(
              height: 5.h,
            ),
            BlocBuilder<SignInCubit, SignInState>(
              builder: (context, state) {
                return SettingsContainer(
                  onTap: () {
                    context.read<SignInCubit>().signOut();
                  },
                  icon: Icons.lock,
                  text: 'Sign Out',
                  editContainer: false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
