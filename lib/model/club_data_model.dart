import 'package:freezed_annotation/freezed_annotation.dart';

part 'club_data_model.freezed.dart';
part 'club_data_model.g.dart';

// 1. Main Response from API
@freezed
class ApiResponse with _$ApiResponse {
  const factory ApiResponse({
    required bool success, // Was the API call successful?
    required String message, // Success/error message
    required DataContainer data, // Contains the actual data
  }) = _ApiResponse;

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);
}

// 2. Container for the list of clubs
@freezed
class DataContainer with _$DataContainer {
  const factory DataContainer({
    required List<ClubDataModel> locations, // List of all clubs
  }) = _DataContainer;

  factory DataContainer.fromJson(Map<String, dynamic> json) =>
      _$DataContainerFromJson(json);
}

// 3. Individual Club Data
@freezed
class ClubDataModel with _$ClubDataModel {
  const factory ClubDataModel({
    @JsonKey(name: 'master_id') required int masterId,
    @JsonKey(name: 'location_id') int? locationId,
    required String currency,
    @JsonKey(name: 'title') required String name,
    @JsonKey(name: 'time_zone') required String timeZone,
    @JsonKey(name: 'street_address') required String address,
    required String city,
    required String state,
    required String country,
    @JsonKey(name: 'postal_code') required String postalCode,
    required String email,
    required String phone,
    required String latitude,
    required String longitude,
    required String facilities,
    @JsonKey(name: 'location_image_1') required String locationImage1,
    @JsonKey(name: 'location_image_2') String? locationImage2,
    @JsonKey(name: 'location_image_3') String? locationImage3,
    @JsonKey(name: 'location_image_4') String? locationImage4,
    required String logo,
    @JsonKey(name: 'membership_mandatory_before_booking')
    required bool membershipMandatory,
    @JsonKey(name: 'court_count') required int courtCount,
  }) = _ClubDataModel;

  factory ClubDataModel.fromJson(Map<String, dynamic> json) =>
      _$ClubDataModelFromJson(json);
}
