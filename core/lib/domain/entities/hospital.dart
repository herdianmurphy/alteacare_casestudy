import 'package:core/core.dart';
import 'package:equatable/equatable.dart';

class Hospital extends Equatable {
  Hospital({
    required this.id,
    required this.name,
  });

  String? id;
  String? name;

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
