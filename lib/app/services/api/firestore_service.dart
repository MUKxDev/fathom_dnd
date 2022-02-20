import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FirestoreService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

/* -------------------------------------------------------------------------- */
/*                                 References                                 */
/* -------------------------------------------------------------------------- */
  CollectionReference<Map<String, dynamic>> get characters =>
      firestore.collection('Characters');
}
