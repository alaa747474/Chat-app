import 'package:chat_app/features/auth/presentation/widgets/auth_widgets.dart';
import 'package:chat_app/features/home/presentation/screens/home_screen.dart';
import 'package:chat_app/features/settings/business_logic/user_information_cubit/user_information_cubit.dart';
import 'package:chat_app/features/settings/presentation/widgets/user_information_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

import '../../business_logic/settings_cubit/settings_cubit.dart';

class UserInformationScreen extends StatefulWidget {
  const UserInformationScreen({super.key});
  static const String routeName = '/user_information_screen';

  @override
  State<UserInformationScreen> createState() => _UserInformationScreenState();
}

final TextEditingController nameController = TextEditingController();
final TextEditingController emailController = TextEditingController();

class _UserInformationScreenState extends State<UserInformationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Your Profile',
          style: Theme.of(context).textTheme.labelSmall,
        ),
        centerTitle: true,
      ),
      body: BlocConsumer<UserInformationCubit,UserInformationState>(
        listener: (context, state) {
          if (state is UserInformationSaved) {
            Navigator.pushReplacementNamed(context, HomeScreen.routeName);
          }
        },
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocConsumer<SettingsCubit, SettingsState>(
                listener: (context, state) {
                  if (state is ImageLoaded) {
                    context.read<UserInformationCubit>().getProfilePictureUrl(file: state.image);
                  }
                },
                builder: (context, state) {
                  if (state is ImageLoaded) {
                    return CircleAvatar(
                      radius: 50.r,
                      backgroundImage: FileImage(state.image),
                    );
                  }
                  return InkWell(
                    onTap: () {
                      context
                          .read<SettingsCubit>()
                          .pickImage(source: ImageSource.camera);
                    },
                    child: Center(
                      child: CircleAvatar(
                        backgroundColor: Theme.of(context).primaryColor,
                        radius: 50.r,
                        child: Center(
                          child: Icon(
                            Icons.person,
                            size: 70.r,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 40.h,
              ),
              UserInformationTextField(
                  hintText: 'Name', controller: nameController),
              SizedBox(
                height: 10.h,
              ),
              UserInformationTextField(
                  hintText: 'E-mail', controller: emailController),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 30.w,vertical: 20.h),
                child: CustomButton(text: 'Confirm', onPressed: (){
                  context.read<UserInformationCubit>().saveUserData(name: nameController.text, email: emailController.text,);
                }),
              )
            ],
          );
        },
      ),
    );
  }
}
