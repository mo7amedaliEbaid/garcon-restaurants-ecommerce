import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/models.dart';

part 'base_info_repo.dart';

class InfoRepo extends BaseInfoRepository {
  final FirebaseFirestore _firebaseFirestore;

  InfoRepo({FirebaseFirestore? firebaseFirestore})
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
