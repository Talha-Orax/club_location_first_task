import 'dart:convert';
import 'package:club_location_first_task/model/club_data_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<ClubDataModel>> fetchLocations() async {
    final response = await http.get(
      Uri.parse("http://209.97.211.101/apiv1/locations.ashx"),
      headers: {
        'Cache-Control': 'no-cache',
        'Accept': '*/*',
        'Accept-Encoding': 'gzip, deflate, br',
        'Connection': 'keep-alive',
        'APIKey': '83964656-2342-4a00-b8ae-b74973461e94',
        'access_Token': '681c5d77-a452-4912-834d-3424ec6efbc5',
      },
    );

    if (response.statusCode == 200) {
      final apiResponse = ApiResponse.fromJson(jsonDecode(response.body));
      if (apiResponse.success) {
        return apiResponse.data.locations;
      } else {
        throw Exception(apiResponse.message);
      }
    } else {
      throw Exception(
          'Failed to load clubs. Status code: ${response.statusCode}');
    }
  }
}
