import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Restaurant extends Equatable {
  final String id;
  final String name;
  final String image;
  final String views;
  final String reviews;
  final List<dynamic> tags;

  const Restaurant({
    required this.id,
    required this.name,
    required this.image,
    required this.views,
    required this.reviews,
    required this.tags,
  });

  static Restaurant fromSnapShot(DocumentSnapshot snap) {
    Restaurant restaurant = Restaurant(
      name: snap['name'],
      id: snap['id'],
      image: snap['image'],
      views: snap['views'],
      reviews: snap['reviews'],
      tags: snap['tags'],
    );
    return restaurant;
  }

  @override
  List<Object?> get props => [
        name,
        id,
        image,
        views,
        reviews,
        tags,
      ];
}
