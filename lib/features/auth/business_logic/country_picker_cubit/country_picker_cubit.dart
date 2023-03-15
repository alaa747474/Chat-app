import 'package:bloc/bloc.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
part 'country_picker_state.dart';

class CountryPickerCubit extends Cubit<CountryPickerState> {
  CountryPickerCubit() : super(CountryPickerInitial());

  pickCountry(BuildContext context) {
    showCountryPicker(
        exclude: ['IL'],
        showPhoneCode: true,
        countryListTheme: CountryListThemeData(
            searchTextStyle: Theme.of(context).textTheme.labelMedium,
            bottomSheetHeight: 600.h,
            backgroundColor: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.r),
              topRight: Radius.circular(10.r),
            ),
            inputDecoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.r)),
                  borderSide: BorderSide.none,
                ),
                hintText: 'search',
                filled: true,
                fillColor: Theme.of(context).shadowColor)),
        context: context,
        onSelect: (s) {
          emit(CountryPicked(s.phoneCode, s.countryCode, s.name));
        });
  }
}
