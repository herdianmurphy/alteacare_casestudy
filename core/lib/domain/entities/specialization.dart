import 'package:equatable/equatable.dart';

class Specialization extends Equatable {
  Specialization({
    required this.id,
    required this.name,
  });

  String id;
  String name;

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
