import 'package:core/core.dart';
import 'package:equatable/equatable.dart';

class PriceModel extends Equatable {
  PriceModel({
    required this.raw,
    required this.formatted,
  });

  final int raw;
  final String formatted;

  factory PriceModel.fromJson(Map<String, dynamic> json) => PriceModel(
        raw: json["raw"],
        formatted: json["formatted"],
      );

  Map<String, dynamic> toJson() => {
        "raw": raw,
        "formatted": formatted,
      };

  Price toEntity() {
    return Price(
      raw: raw,
      formatted: formatted,
    );
  }

  @override
  List<Object?> get props => [
        raw,
        formatted,
      ];
}
