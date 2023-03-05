import 'package:chat_app/core/services/firebase_storage_service.dart';
import 'package:chat_app/core/services/firestore_service.dart';
import 'package:chat_app/features/auth/business_logic/sign_in_cubit/sign_in_cubit.dart';
import 'package:chat_app/features/auth/data/repository/sign_in_repository.dart';
import 'package:chat_app/features/contacts/business_logic/contacts_cubit/contacts_cubit.dart';
import 'package:chat_app/features/contacts/business_logic/logged_in_contacts_cubit/logged_in_contacts_cubit.dart';
import 'package:chat_app/features/contacts/data/repository/contacts_repository.dart';
import 'package:chat_app/features/settings/business_logic/user_information_cubit/user_information_cubit.dart';
import 'package:chat_app/features/settings/data/repository/user_information_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
void serviceLocatorSetUp() {
  getIt.registerSingleton<SignInCubit>(SignInCubit(
      FirebaseAuth.instance, SignInRepository(FirebaseAuth.instance)));
  getIt.registerSingleton<UserInformationCubit>(UserInformationCubit(
      UserInformationRepository(
          FirebaseStorageService(FirebaseStorage.instance),
          FirebaseAuth.instance,
          FirestoreService(FirebaseFirestore.instance))));
  getIt.registerSingleton<ContactsCubit>(ContactsCubit(ContactsRepository(FirestoreService(FirebaseFirestore.instance))));  
    getIt.registerSingleton<LoggedInContactsCubit>(LoggedInContactsCubit(ContactsRepository(FirestoreService(FirebaseFirestore.instance))));        
}
