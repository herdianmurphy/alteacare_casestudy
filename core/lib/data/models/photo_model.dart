import 'package:core/core.dart';
import 'package:equatable/equatable.dart';

class PhotoModel extends Equatable {
  PhotoModel({
    required this.url,
  });

  final String url;

  factory PhotoModel.fromJson(Map<String, dynamic> json) => PhotoModel(
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };

  Photo toEntity() {
    return Photo(
      url: url,
    );
  }

  @override
  List<Object?> get props => [
        url,
      ];
}
