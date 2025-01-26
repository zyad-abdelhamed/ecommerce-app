import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final int id;
  final String image;
  final String name;
  const Category({required this.id, required this.name, required this.image});
  Map<String, dynamic> toJson() => {'id': id, 'name': name, 'image': image};

  @override
  List<Object?> get props => [id, name, image];
}
