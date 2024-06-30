import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/models.dart';

part 'base_about_repo.dart';

class AboutRepo extends BaseAboutRepository {
  final FirebaseFirestore _firebaseFirestore;

  AboutRepo({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<AboutUs> getAboutUs() {
    return _firebaseFirestore
        .collection('info')
        .doc("about")
        .snapshots()
        .map((snap) => AboutUs.fromSnapShot(snap));
  }
}
