import 'package:core/core.dart';
import 'package:equatable/equatable.dart';

class DoctorModel extends Equatable {
  DoctorModel({
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

  final String doctorId;
  final String name;
  final String slug;
  final bool isPopular;
  final String about;
  final String overview;
  final PhotoModel photo;
  final String sip;
  final String experience;
  final PriceModel price;
  final SpecializationModel specialization;
  final List<HospitalModel> hospital;
  final String aboutPreview;

  factory DoctorModel.fromJson(Map<String, dynamic> json) => DoctorModel(
        doctorId: json["doctor_id"],
        name: json["name"],
        slug: json["slug"],
        isPopular: json["is_popular"],
        about: json["about"],
        overview: json["overview"],
        photo: PhotoModel.fromJson(json['photo']),
        sip: json["sip"],
        experience: json["experience"],
        price: PriceModel.fromJson(json['price']),
        specialization: SpecializationModel.fromJson(json['specialization']),
        hospital: List<HospitalModel>.from(
            json["hospital"].map((x) => HospitalModel.fromJson(x))),
        aboutPreview: json["about_preview"],
      );

  Map<String, dynamic> toJson() => {
        "doctor_id": doctorId,
        "name": name,
        "slug": slug,
        "is_popular": isPopular,
        "about": about,
        "overview": overview,
        "photo": photo.toJson(),
        "sip": sip,
        "experience": experience,
        "price": price.toJson(),
        "specialization": specialization.toJson(),
        "hospital": List<dynamic>.from(hospital.map((x) => x.toJson())),
        "about_preview": aboutPreview,
      };

  Doctor toEntity() {
    return Doctor(
      doctorId: doctorId,
      name: name,
      slug: slug,
      isPopular: isPopular,
      about: about,
      overview: overview,
      photo: photo.toEntity(),
      sip: sip,
      experience: experience,
      price: price.toEntity(),
      specialization: specialization.toEntity(),
      hospital: hospital.map((hospital) => hospital.toEntity()).toList(),
      aboutPreview: aboutPreview,
    );
  }

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
