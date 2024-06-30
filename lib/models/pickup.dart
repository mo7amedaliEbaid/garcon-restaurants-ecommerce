import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class PickUp extends Equatable {
  final String id;
  final String name;
  final String image;
  final String price;
  final String category;
  final String description;

  const PickUp({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.category,
    required this.description,
  });

  static PickUp fromSnapShot(DocumentSnapshot snap) {
    PickUp pickUp = PickUp(
      name: snap['name'],
      id: snap['id'],
      image: snap['image'],
      price: snap['price'],
      category: snap['category'],
      description: snap['description'],
    );
    return pickUp;
  }

  @override
  List<Object?> get props => [
        name,
        id,
        image,
        price,
        category,
        description,
      ];
}
