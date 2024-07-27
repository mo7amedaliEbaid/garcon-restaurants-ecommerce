import 'package:cloud_firestore/cloud_firestore.dart';

import '../../models/models.dart';

part 'base_contact_us_repo.dart';

class ContactUsRepository implements BaseContactUsRepository {
  final FirebaseFirestore _firebaseFirestore;

  ContactUsRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<void> addContactUs(ContactUs contactUs) async {
    await _firebaseFirestore.collection('contact_us').add(contactUs.toMap());
  }
}
