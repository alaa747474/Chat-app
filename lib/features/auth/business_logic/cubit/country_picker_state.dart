part of 'country_picker_cubit.dart';

@immutable
abstract class CountryPickerState {}

class CountryPickerInitial extends CountryPickerState {}
class CountryPicked extends CountryPickerState{
  final String phoneCode;
  final String countryCode;
  final String countryName;
  CountryPicked(this.phoneCode,this.countryCode,this.countryName);
}
