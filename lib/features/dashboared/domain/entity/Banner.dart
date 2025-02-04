import 'package:equatable/equatable.dart';

class Banners extends Equatable {
  final int id;
  final String image;
  const Banners({required this.id, required this.image});

  Map<String, dynamic> toJson() => {'id': id, 'image': image};

  @override
  List<Object?> get props => [id, image];
}
