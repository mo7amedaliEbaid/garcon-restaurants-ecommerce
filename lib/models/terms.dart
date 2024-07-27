import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Terms extends Equatable {
  final String header1;
  final String subheader1;
  final String header2;
  final String subheader2;

  const Terms({
    required this.header1,
    required this.subheader1,
    required this.header2,
    required this.subheader2,
  });

  static Terms fromSnapShot(DocumentSnapshot snap) {
    Terms terms = Terms(
      header1: snap["header1"],
      subheader1: snap["subheader1"],
      header2: snap["header2"],
      subheader2: snap["subheader2"],
    );
    return terms;
  }

  @override
  List<Object?> get props => [
        header1,
        subheader1,
        header2,
        subheader2,
      ];
}
