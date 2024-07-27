import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:garcon/models/terms.dart';
import 'package:garcon/repositories/terms/base_terms_repo.dart';

class TermsRepository extends BaseTermsRepository {
  final FirebaseFirestore _firebaseFirestore;

  TermsRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<Terms> getTerms() {
    return _firebaseFirestore
        .collection("info")
        .doc("terms")
        .snapshots()
        .map((snap) => Terms.fromSnapShot(snap));
  }
}
