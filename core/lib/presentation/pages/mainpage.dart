import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:shimmer/shimmer.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<String> _hospitalList = [
    "Mitra Keluarga Bintaro",
    "Mitra Keluarga Gading Serpong",
  ];

  final List<String> _specializationList = [
    "Dokter Umum",
    "Anak",
    "Penyakit Dalam",
    "Kebidanan & Kandungan",
    "Bedah",
    "Jantung & Pem.Darah",
    "Kulit & Kelamin",
  ];

  List<Doctor> doctorList = [];
  List<Doctor> filteredDoctorList = [];
  String? hospitalName, specializationName;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    context.read<DoctorBloc>().add(FetchDoctorList());
  }

  void searchDoctor(doctorName, hospitalName, specializationName) {
    setState(() {
      filteredDoctorList = doctorList
          .where((doctor) =>
              doctor.name!.toLowerCase().contains(doctorName.toLowerCase()) &&
              doctor.hospital![0].name!
                  .contains(hospitalName ?? "".toLowerCase()) &&
              doctor.specialization!.name
                  .contains(specializationName ?? "".toLowerCase()))
          .toList();
    });
  }

  Widget _buildItem(BuildContext context, Doctor doctor) {
    return Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
          side: BorderSide(
            color: Colors.grey.shade200,
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                width: MediaQuery.of(context).size.width * 0.2,
                height: MediaQuery.of(context).size.width * 0.2,
                imageUrl: doctor.photo!.url,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                  ),
                ),
                errorWidget: (context, url, error) =>
                    const Icon(Icons.image, size: 40),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctor.name!,
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 2.0),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              '${doctor.hospital![0].name} - ${doctor.specialization!.name}',
                              style: TextStyle(
                                  color: ColorResource().mainBlue,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Html(
                        data: doctor.aboutPreview,
                        style: {
                          '#': Style(
                            margin: EdgeInsets.zero,
                            padding: EdgeInsets.zero,
                            color: Colors.grey,
                            fontSize: const FontSize(11),
                            maxLines: 3,
                            textOverflow: TextOverflow.ellipsis,
                          ),
                        },
                      ),
                      const SizedBox(height: 8.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            doctor.price!.formatted,
                            style: TextStyle(
                              color: ColorResource().mainGreen,
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Toolbar(title: 'Doctor List'),
      backgroundColor: ColorResource().mainBackground,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 12.0, right: 12.0),
            child: SizedBox(
              height: 50,
              child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(
                      color: Colors.grey.shade200,
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 16),
                      const Icon(Icons.search_outlined,
                          size: 20.0, color: Colors.black87),
                      const SizedBox(width: 8),
                      Expanded(
                          child: TextFormField(
                        controller: searchController,
                        onChanged: (value) {
                          searchDoctor(
                              value, hospitalName, specializationName);
                        },
                        decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Cari Dokter...',
                            hintStyle: TextStyle(color: Colors.grey),
                            contentPadding: EdgeInsets.only(bottom: 8.0)),
                        textInputAction: TextInputAction.search,
                        style: const TextStyle(fontSize: 14.0),
                      )),
                      const SizedBox(width: 16),
                    ],
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 20.0, top: 8.0, right: 20.0, bottom: 4.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(4.0)),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: hospitalName,
                        hint: const Text(
                          'Pilih Rumah Sakit',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black54,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        items: _hospitalList
                            .map((value) => DropdownMenuItem(
                                  child: Text(
                                    value,
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black54,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  value: value,
                                ))
                            .toList(),
                        onChanged: (String? value) {
                          hospitalName = value;
                          searchDoctor(searchController.text,
                              hospitalName, specializationName);
                        },
                        isExpanded: true,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Container(
                    height: 40,
                    padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(4.0)),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        value: specializationName,
                        hint: const Text(
                          'Pilih Specialist',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black54,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        items: _specializationList
                            .map((value) => DropdownMenuItem(
                                  child: Text(
                                    value,
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.black54,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  value: value,
                                ))
                            .toList(),
                        onChanged: (String? value) {
                          specializationName = value;
                          searchDoctor(searchController.text,
                              hospitalName, specializationName);
                        },
                        isExpanded: true,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child:
                BlocBuilder<DoctorBloc, DoctorState>(builder: (context, state) {
              if (state is DoctorLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is DoctorLoaded) {
                if (searchController.text.isEmpty) {
                  doctorList = state.data;
                  filteredDoctorList = doctorList;
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(12.0),
                    itemCount: filteredDoctorList.length,
                    itemBuilder: (context, index) {
                      final doctor = filteredDoctorList[index];
                      return Column(
                        children: [
                          _buildItem(context, doctor),
                          const SizedBox(height: 6.0),
                        ],
                      );
                    },
                  );
                } else {
                  doctorList = state.data;
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.all(12.0),
                    itemCount: filteredDoctorList.length,
                    itemBuilder: (context, index) {
                      final doctor = filteredDoctorList[index];
                      return Column(
                        children: [
                          _buildItem(context, doctor),
                          const SizedBox(height: 6.0),
                        ],
                      );
                    },
                  );
                }
              } else if (state is DoctorError) {
                return Center(child: Text(state.message));
              } else {
                return Container();
              }
            }),
          ),
        ],
      ),
    );
  }
}
