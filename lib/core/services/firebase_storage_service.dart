import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService {
  final FirebaseStorage _firebaseStorage;

  FirebaseStorageService(this._firebaseStorage);
  Future<String>saveFilesToFirebaseStorage(
      {required String folderName,
      required String imageName,
      required File file}) async {
    Reference folderReference = _firebaseStorage.ref().child(folderName);
    Reference fileReference = folderReference.child(imageName);
    UploadTask uploadTask = fileReference.putFile(file);
    TaskSnapshot taskSnapshot = await uploadTask;
    return await taskSnapshot.ref.getDownloadURL();
  }
}
