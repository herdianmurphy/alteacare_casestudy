import 'package:core/core.dart';
import 'package:equatable/equatable.dart';

class HospitalModel extends Equatable {
  HospitalModel({
    required this.id,
    required this.name,
  });

  final String id;
  final String name;

  factory HospitalModel.fromJson(Map<String, dynamic> json) => HospitalModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };

  Hospital toEntity() {
    return Hospital(
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
