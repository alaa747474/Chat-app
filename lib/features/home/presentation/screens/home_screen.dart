import 'package:chat_app/features/home/business_logic/cubit/home_cubit.dart';
import 'package:chat_app/features/home/presentation/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home_Screen';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Scaffold(
            bottomNavigationBar: const CustomBottomNavBar(),
            body: context
                .read<HomeCubit>()
                .screens[context.read<HomeCubit>().selectedIndex],
            backgroundColor: Colors.black,
          );
        },
      ),
    );
  }
}
