import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class AboutUs extends Equatable {
  final String verse1;
  final String verse2;

  const AboutUs({
    required this.verse1,
    required this.verse2,
  });

  static AboutUs fromSnapShot(DocumentSnapshot snap) {
    AboutUs aboutUs = AboutUs(
      verse1: snap['verse1'],
      verse2: snap['verse2'],
    );
    return aboutUs;
  }

  @override
  List<Object?> get props => [
        verse1,
        verse2,
      ];
}
