import 'dart:async';
import 'dart:convert';

import 'package:core/core.dart';
import 'package:http/http.dart' as http;

abstract class RemoteDataSource {
  Future<List<DoctorModel>> getDoctorList();
}

class RemoteDataSourceImpl implements RemoteDataSource {
  static const baseUrlApi =
      'https://run.mocky.io/v3/c9a2b598-9c93-4999-bd04-0194839ef2dc';

  final http.Client client;

  RemoteDataSourceImpl({required this.client});

  @override
  Future<List<DoctorModel>> getDoctorList() async {
    final response = await client.get(Uri.parse(baseUrlApi));

    if (response.statusCode == 200) {
      return DoctorResponse.fromJson(json.decode(response.body)).data;
    } else {
      throw ServerException();
    }
  }
}
