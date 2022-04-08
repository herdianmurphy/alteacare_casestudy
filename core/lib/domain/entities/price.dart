import 'package:equatable/equatable.dart';

class Price extends Equatable {
  Price({
    required this.raw,
    required this.formatted,
  });

  int raw;
  String formatted;

  @override
  List<Object?> get props => [
        raw,
        formatted,
      ];
}
