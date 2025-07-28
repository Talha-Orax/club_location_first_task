// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'club_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiResponseImpl _$$ApiResponseImplFromJson(Map<String, dynamic> json) =>
    _$ApiResponseImpl(
      success: json['success'] as bool,
      message: json['message'] as String,
      data: DataContainer.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ApiResponseImplToJson(_$ApiResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_$DataContainerImpl _$$DataContainerImplFromJson(Map<String, dynamic> json) =>
    _$DataContainerImpl(
      locations: (json['locations'] as List<dynamic>)
          .map((e) => ClubDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$DataContainerImplToJson(_$DataContainerImpl instance) =>
    <String, dynamic>{
      'locations': instance.locations,
    };

_$ClubDataModelImpl _$$ClubDataModelImplFromJson(Map<String, dynamic> json) =>
    _$ClubDataModelImpl(
      masterId: (json['master_id'] as num).toInt(),
      locationId: (json['location_id'] as num?)?.toInt(),
      currency: json['currency'] as String,
      name: json['title'] as String,
      timeZone: json['time_zone'] as String,
      address: json['street_address'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      country: json['country'] as String,
      postalCode: json['postal_code'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      latitude: json['latitude'] as String,
      longitude: json['longitude'] as String,
      facilities: json['facilities'] as String,
      locationImage1: json['location_image_1'] as String,
      locationImage2: json['location_image_2'] as String?,
      locationImage3: json['location_image_3'] as String?,
      locationImage4: json['location_image_4'] as String?,
      logo: json['logo'] as String,
      membershipMandatory: json['membership_mandatory_before_booking'] as bool,
      courtCount: (json['court_count'] as num).toInt(),
    );

Map<String, dynamic> _$$ClubDataModelImplToJson(_$ClubDataModelImpl instance) =>
    <String, dynamic>{
      'master_id': instance.masterId,
      'location_id': instance.locationId,
      'currency': instance.currency,
      'title': instance.name,
      'time_zone': instance.timeZone,
      'street_address': instance.address,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'postal_code': instance.postalCode,
      'email': instance.email,
      'phone': instance.phone,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'facilities': instance.facilities,
      'location_image_1': instance.locationImage1,
      'location_image_2': instance.locationImage2,
      'location_image_3': instance.locationImage3,
      'location_image_4': instance.locationImage4,
      'logo': instance.logo,
      'membership_mandatory_before_booking': instance.membershipMandatory,
      'court_count': instance.courtCount,
    };
