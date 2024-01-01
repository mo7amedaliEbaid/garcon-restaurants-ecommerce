import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Tag extends Equatable {
  final String name;

  const Tag({
    required this.name,
  });

  static Tag fromSnapShot(DocumentSnapshot snap) {
    Tag tag = Tag(
      name: snap['name'],
    );
    return tag;
  }

  @override
  List<Object?> get props => [
        name,
      ];
}
