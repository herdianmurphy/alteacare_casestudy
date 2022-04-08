import 'package:core/core.dart';
import 'package:equatable/equatable.dart';

class DoctorResponse extends Equatable {
  final List<DoctorModel> data;

  DoctorResponse({required this.data});

  factory DoctorResponse.fromJson(Map<String, dynamic> json) => DoctorResponse(
        data: List<DoctorModel>.from(
            (json["data"] as List).map((x) => DoctorModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };

  @override
  List<Object> get props => [data];
}
