import 'package:chat_app/features/auth/presentation/widgets/custom_button.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});
  static const String routeName = '/sign_in_screen';
   
  String generateCountryFlag() {
    String countryCode = 'eg';
    String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
        (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
    return flag;
  }
  showContry(BuildContext context){
    showCountryPicker(
                    exclude: ['IL'],
                    showPhoneCode: true,
                    countryListTheme: CountryListThemeData(
                        searchTextStyle: Theme.of(context).textTheme.bodyText2,
                        bottomSheetHeight: 600.h,
                        backgroundColor: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.r),
                          topRight: Radius.circular(10.r),
                        ),
                        inputDecoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.r)),
                              borderSide: BorderSide.none,
                            ),
                            hintText: 'search',
                            filled: true,
                            fillColor: Theme.of(context).shadowColor)),
                    context: context,
                    onSelect: (s) {

                    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 15.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              LottieBuilder.network(
                  'https://assets6.lottiefiles.com/packages/lf20_syHuxRsS8U.json'),
              Text('Your Phone',style: Theme.of(context).textTheme.headline1,),
              SizedBox(height: 15.h,),
              Text('please confirm your country code and enter your phone number',textAlign: TextAlign.center,style: Theme.of(context).textTheme.headline3!.copyWith(fontWeight: FontWeight.normal)),
              Divider(color: Theme.of(context).highlightColor,thickness: 1,),
              Row(
              
                children: [
                  Text(generateCountryFlag()),
                  TextButton(onPressed: (){
                    showContry(context);
                  }, child:  Text('Select Country',style: Theme.of(context).textTheme.bodyText1,)),
                ],
              ),
              Divider(color: Theme.of(context).highlightColor,thickness: 1,),
             // TODO : TextField,
             TextField(),
              Divider(color: Theme.of(context).highlightColor,thickness: 1,),
              SizedBox(height: 20.h,),
              CustomButton(text: 'Continue', onPressed: (){})
            ],
          ),
        ),
      ),
    );
  }
}
