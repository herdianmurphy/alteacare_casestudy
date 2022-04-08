import 'package:core/core.dart';
import 'package:equatable/equatable.dart';

class SpecializationModel extends Equatable {
  SpecializationModel({
    required this.id,
    required this.name,
  });

  final String id;
  final String name;

  factory SpecializationModel.fromJson(Map<String, dynamic> json) =>
      SpecializationModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  Specialization toEntity() {
    return Specialization(
      id: id,
      name: name,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
