import 'package:chat_app/features/auth/business_logic/cubit/country_picker_cubit.dart';
import 'package:chat_app/features/auth/presentation/screens/otp_screen.dart';
import 'package:chat_app/features/auth/presentation/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});
  static const String routeName = '/sign_in_screen';
  String generateCountryFlag(String countryCode) {
    String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
        (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
    return flag;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: SingleChildScrollView(
          child: BlocBuilder<CountryPickerCubit, CountryPickerState>(
            builder: (context, state) {
              return Column(
                children: [
                  LottieBuilder.network(
                      'https://assets6.lottiefiles.com/packages/lf20_syHuxRsS8U.json'),
                  Text(
                    'Your Phone',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Text(
                      'please confirm your country code and enter your phone number',
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline3!
                          .copyWith(fontWeight: FontWeight.normal)),
                  Divider(
                    color: Theme.of(context).highlightColor,
                    thickness: 1,
                  ),
                  BlocBuilder<CountryPickerCubit, CountryPickerState>(
                    builder: (context, state) {
                      if (state is CountryPicked) {
                        return InkWell(
                          onTap: () {
                            context
                                .read<CountryPickerCubit>()
                                .pickCountry(context);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 15.w, vertical: 10.h),
                            child: Row(
                              children: [
                                Text(generateCountryFlag(state.countryCode)),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  state.countryName,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                      return TextButton(
                          onPressed: () {
                            context
                                .read<CountryPickerCubit>()
                                .pickCountry(context);
                          },
                          child: Text(
                            'Select Country',
                            style: Theme.of(context).textTheme.bodyText1,
                          ));
                    },
                  ),
                  Divider(
                    color: Theme.of(context).highlightColor,
                    thickness: 1,
                  ),
                  BlocBuilder<CountryPickerCubit, CountryPickerState>(
                    builder: (context, state) {
                      if (state is CountryPicked) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 10.h),
                          child: Row(
                            children: [
                              Text('+${state.phoneCode}'),
                              SizedBox( width: 15.w,),
                              Flexible(
                                  child: TextField(
                                     inputFormatters: [
                                      LengthLimitingTextInputFormatter(10)
                                     ],
                                    keyboardType: TextInputType.phone,
                                    style: Theme.of(context).textTheme.bodyText2,
                                    controller: TextEditingController(),
                                    decoration:  InputDecoration.collapsed(
                                    hintText: '00 0000 0000',
                                    hintStyle: Theme.of(context).textTheme.headline5
                                    ),
                              ))
                            ],
                          ),
                        );
                      }
                      return Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 10.h),
                        child: Row(
                          children: [
                            const Text('+20'),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              '00 0000 0000',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  Divider(
                    color: Theme.of(context).highlightColor,
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  BlocBuilder<CountryPickerCubit, CountryPickerState>(
                    builder: (context, state) {
                      if (state is CountryPicked) {
                        return CustomButton(
                          text: 'Continue',
                          onPressed: ()=>Navigator.pushNamed(context, OTPScreen.routeName),
                        );
                      }
                      return const CustomButton(
                        text: 'Continue',
                        onPressed: null,
                      );
                    },
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
