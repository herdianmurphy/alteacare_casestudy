import 'package:core/core.dart';
import 'package:equatable/equatable.dart';

class Doctor extends Equatable {
  Doctor({
    required this.doctorId,
    required this.name,
    required this.slug,
    required this.isPopular,
    required this.about,
    required this.overview,
    required this.photo,
    required this.sip,
    required this.experience,
    required this.price,
    required this.specialization,
    required this.hospital,
    required this.aboutPreview,
  });

  String? doctorId;
  String? name;
  String? slug;
  bool? isPopular;
  String? about;
  String? overview;
  Photo? photo;
  String? sip;
  String? experience;
  Price? price;
  Specialization? specialization;
  List<Hospital>? hospital;
  String? aboutPreview;

  @override
  List<Object?> get props => [
        doctorId,
        name,
        slug,
        isPopular,
        about,
        overview,
        photo,
        sip,
        experience,
        price,
        specialization,
        hospital,
        aboutPreview,
      ];
}
