import 'package:equatable/equatable.dart';

class Photo extends Equatable {
  Photo({
    required this.url,
  });

  String url;

  @override
  List<Object?> get props => [
        url,
      ];
}
