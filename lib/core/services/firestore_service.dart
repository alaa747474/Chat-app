import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firebaseFirestore;
  FirestoreService(this._firebaseFirestore);
  
 Future setDataToFirestore(
      {required String collection, required dynamic data,required String doc}) async {
       await _firebaseFirestore.collection(collection).doc(doc).set(data);
  }
 Future<List<T>>getCollectionData<T>({
  required String collection,
  required T Function(Map<String, dynamic>? data) builder
 })async{
 var reference= await _firebaseFirestore.collection(collection).get();
 return reference.docs.map((e) => builder(e.data())).toList();
 }
}
