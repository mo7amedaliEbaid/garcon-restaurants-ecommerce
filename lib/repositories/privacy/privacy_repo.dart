import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:garcon/models/info.dart';
import 'package:garcon/repositories/privacy/base_privacy_repo.dart';

class PrivacyRepository extends BasePrivacyRepository {
  final FirebaseFirestore _firebaseFirestore;

  PrivacyRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<Info> getPrivacy() {
    return _firebaseFirestore
        .collection("info")
        .doc("privacy")
        .snapshots()
        .map((snap) => Info.fromSnapShot(snap));
  }
}
