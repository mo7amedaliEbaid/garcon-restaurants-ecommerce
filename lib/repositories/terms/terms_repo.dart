import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:garcon/models/models.dart';
part  'base_terms_repo.dart';
class TermsRepository extends BaseTermsRepository {
  final FirebaseFirestore _firebaseFirestore;

  TermsRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<Info> getTerms() {
    return _firebaseFirestore
        .collection("info")
        .doc("terms")
        .snapshots()
        .map((snap) => Info.fromSnapShot(snap));
  }
}
