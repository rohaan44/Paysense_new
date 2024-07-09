import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
class BePayAmnt_Controller{
final FirebaseFirestore user = FirebaseFirestore.instance;

// Stream<List<Map<String, dynamic>>> getUserAmount(){
//   return user.collection('users').snapshots().map((snapshot) {
//     return snapshot.docs.map((doc) {
//       final amount = doc.data();
//       return amount;
//     }).toList();
//   });
// }
// }
Stream<List<Map<String, dynamic>>> getUserAmount() {
  return FirebaseFirestore.instance.collection('users').snapshots().map((snapshot) {
    return snapshot.docs.map((doc) => doc.data()).toList();
  });
}
}