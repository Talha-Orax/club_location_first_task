import 'dart:convert';
import 'package:club_location_first_task/model/club_data_model.dart';
import 'package:club_location_first_task/model/filter_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<DataContainer> fetchLocations() async {
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

    // Check if the response is successful
    if (response.statusCode == 200) {
      final apiResponse = ApiResponse.fromJson(jsonDecode(response.body));
      print('Response Body: ${apiResponse.data.locations}');
      if (apiResponse.success) {
        return apiResponse.data;
      } else {
        throw Exception(apiResponse.message);
      }
    } else {
      throw Exception(
          'Failed to load clubs. Status code: ${response.statusCode}');
    }
  }

  Future<DataContainer> fetchfilteredLocations(FilterModel filter) async {
    Map<String, String> queryParams = filter.toQueryParams();
    print(
        'Query Parameters: $queryParams'); // Debugging line to check query params

    Uri uri = Uri.parse("http://209.97.211.101/apiv1/locations.ashx")
        .replace(queryParameters: queryParams);
    print('Request URI: $uri'); // Debugging line to check the full request URI

    final response = await http.get(
      uri,
      headers: {
        'APIKey': '83964656-2342-4a00-b8ae-b74973461e94',
        'access_Token': '681c5d77-a452-4912-834d-3424ec6efbc5',
      },
    );
    print('Response Status Code: ${response.statusCode}'); // Debugging line
    print(
        'Response Body: ${response.body}'); // Debugging line to check response body
    // Check if the response is successful
    if (response.statusCode == 200) {
      final apiResponse = ApiResponse.fromJson(jsonDecode(response.body));
      print(
          'API Response: ${apiResponse}'); // Debugging line to check API response
      if (apiResponse.success) {
        return apiResponse.data;
      } else {
        throw Exception(apiResponse.message);
      }
    } else {
      throw Exception(
          'Failed to load clubs. Status code: ${response.statusCode}');
    }
  }
}
