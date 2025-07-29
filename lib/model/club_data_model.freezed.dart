// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'club_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ApiResponse _$ApiResponseFromJson(Map<String, dynamic> json) {
  return _ApiResponse.fromJson(json);
}

/// @nodoc
mixin _$ApiResponse {
  bool get success =>
      throw _privateConstructorUsedError; // Was the API call successful?
  String get message =>
      throw _privateConstructorUsedError; // Success/error message
  DataContainer get data => throw _privateConstructorUsedError;

  /// Serializes this ApiResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ApiResponseCopyWith<ApiResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiResponseCopyWith<$Res> {
  factory $ApiResponseCopyWith(
          ApiResponse value, $Res Function(ApiResponse) then) =
      _$ApiResponseCopyWithImpl<$Res, ApiResponse>;
  @useResult
  $Res call({bool success, String message, DataContainer data});

  $DataContainerCopyWith<$Res> get data;
}

/// @nodoc
class _$ApiResponseCopyWithImpl<$Res, $Val extends ApiResponse>
    implements $ApiResponseCopyWith<$Res> {
  _$ApiResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DataContainer,
    ) as $Val);
  }

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DataContainerCopyWith<$Res> get data {
    return $DataContainerCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ApiResponseImplCopyWith<$Res>
    implements $ApiResponseCopyWith<$Res> {
  factory _$$ApiResponseImplCopyWith(
          _$ApiResponseImpl value, $Res Function(_$ApiResponseImpl) then) =
      __$$ApiResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, String message, DataContainer data});

  @override
  $DataContainerCopyWith<$Res> get data;
}

/// @nodoc
class __$$ApiResponseImplCopyWithImpl<$Res>
    extends _$ApiResponseCopyWithImpl<$Res, _$ApiResponseImpl>
    implements _$$ApiResponseImplCopyWith<$Res> {
  __$$ApiResponseImplCopyWithImpl(
      _$ApiResponseImpl _value, $Res Function(_$ApiResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? message = null,
    Object? data = null,
  }) {
    return _then(_$ApiResponseImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as DataContainer,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ApiResponseImpl implements _ApiResponse {
  const _$ApiResponseImpl(
      {required this.success, required this.message, required this.data});

  factory _$ApiResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ApiResponseImplFromJson(json);

  @override
  final bool success;
// Was the API call successful?
  @override
  final String message;
// Success/error message
  @override
  final DataContainer data;

  @override
  String toString() {
    return 'ApiResponse(success: $success, message: $message, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiResponseImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, success, message, data);

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiResponseImplCopyWith<_$ApiResponseImpl> get copyWith =>
      __$$ApiResponseImplCopyWithImpl<_$ApiResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ApiResponseImplToJson(
      this,
    );
  }
}

abstract class _ApiResponse implements ApiResponse {
  const factory _ApiResponse(
      {required final bool success,
      required final String message,
      required final DataContainer data}) = _$ApiResponseImpl;

  factory _ApiResponse.fromJson(Map<String, dynamic> json) =
      _$ApiResponseImpl.fromJson;

  @override
  bool get success; // Was the API call successful?
  @override
  String get message; // Success/error message
  @override
  DataContainer get data;

  /// Create a copy of ApiResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ApiResponseImplCopyWith<_$ApiResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DataContainer _$DataContainerFromJson(Map<String, dynamic> json) {
  return _DataContainer.fromJson(json);
}

/// @nodoc
mixin _$DataContainer {
  List<ClubDataModel> get locations => throw _privateConstructorUsedError;

  /// Serializes this DataContainer to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DataContainer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DataContainerCopyWith<DataContainer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataContainerCopyWith<$Res> {
  factory $DataContainerCopyWith(
          DataContainer value, $Res Function(DataContainer) then) =
      _$DataContainerCopyWithImpl<$Res, DataContainer>;
  @useResult
  $Res call({List<ClubDataModel> locations});
}

/// @nodoc
class _$DataContainerCopyWithImpl<$Res, $Val extends DataContainer>
    implements $DataContainerCopyWith<$Res> {
  _$DataContainerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DataContainer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locations = null,
  }) {
    return _then(_value.copyWith(
      locations: null == locations
          ? _value.locations
          : locations // ignore: cast_nullable_to_non_nullable
              as List<ClubDataModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DataContainerImplCopyWith<$Res>
    implements $DataContainerCopyWith<$Res> {
  factory _$$DataContainerImplCopyWith(
          _$DataContainerImpl value, $Res Function(_$DataContainerImpl) then) =
      __$$DataContainerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ClubDataModel> locations});
}

/// @nodoc
class __$$DataContainerImplCopyWithImpl<$Res>
    extends _$DataContainerCopyWithImpl<$Res, _$DataContainerImpl>
    implements _$$DataContainerImplCopyWith<$Res> {
  __$$DataContainerImplCopyWithImpl(
      _$DataContainerImpl _value, $Res Function(_$DataContainerImpl) _then)
      : super(_value, _then);

  /// Create a copy of DataContainer
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locations = null,
  }) {
    return _then(_$DataContainerImpl(
      locations: null == locations
          ? _value._locations
          : locations // ignore: cast_nullable_to_non_nullable
              as List<ClubDataModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DataContainerImpl implements _DataContainer {
  const _$DataContainerImpl({required final List<ClubDataModel> locations})
      : _locations = locations;

  factory _$DataContainerImpl.fromJson(Map<String, dynamic> json) =>
      _$$DataContainerImplFromJson(json);

  final List<ClubDataModel> _locations;
  @override
  List<ClubDataModel> get locations {
    if (_locations is EqualUnmodifiableListView) return _locations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_locations);
  }

  @override
  String toString() {
    return 'DataContainer(locations: $locations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DataContainerImpl &&
            const DeepCollectionEquality()
                .equals(other._locations, _locations));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_locations));

  /// Create a copy of DataContainer
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DataContainerImplCopyWith<_$DataContainerImpl> get copyWith =>
      __$$DataContainerImplCopyWithImpl<_$DataContainerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DataContainerImplToJson(
      this,
    );
  }
}

abstract class _DataContainer implements DataContainer {
  const factory _DataContainer({required final List<ClubDataModel> locations}) =
      _$DataContainerImpl;

  factory _DataContainer.fromJson(Map<String, dynamic> json) =
      _$DataContainerImpl.fromJson;

  @override
  List<ClubDataModel> get locations;

  /// Create a copy of DataContainer
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DataContainerImplCopyWith<_$DataContainerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ClubDataModel _$ClubDataModelFromJson(Map<String, dynamic> json) {
  return _ClubDataModel.fromJson(json);
}

/// @nodoc
mixin _$ClubDataModel {
  @JsonKey(name: 'master_id')
  int get masterId => throw _privateConstructorUsedError;
  @JsonKey(name: 'location_id')
  int? get locationId => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'time_zone')
  String get timeZone => throw _privateConstructorUsedError;
  @JsonKey(name: 'street_address')
  String get address => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  @JsonKey(name: 'postal_code')
  String get postalCode => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  String get latitude => throw _privateConstructorUsedError;
  String get longitude => throw _privateConstructorUsedError;
  String get facilities => throw _privateConstructorUsedError;
  @JsonKey(name: 'location_image_1')
  String get locationImage1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'location_image_2')
  String? get locationImage2 => throw _privateConstructorUsedError;
  @JsonKey(name: 'location_image_3')
  String? get locationImage3 => throw _privateConstructorUsedError;
  @JsonKey(name: 'location_image_4')
  String? get locationImage4 => throw _privateConstructorUsedError;
  String get logo => throw _privateConstructorUsedError;
  @JsonKey(name: 'membership_mandatory_before_booking')
  bool get membershipMandatory => throw _privateConstructorUsedError;
  @JsonKey(name: 'court_count')
  int get courtCount => throw _privateConstructorUsedError;

  /// Serializes this ClubDataModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClubDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClubDataModelCopyWith<ClubDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClubDataModelCopyWith<$Res> {
  factory $ClubDataModelCopyWith(
          ClubDataModel value, $Res Function(ClubDataModel) then) =
      _$ClubDataModelCopyWithImpl<$Res, ClubDataModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'master_id') int masterId,
      @JsonKey(name: 'location_id') int? locationId,
      String currency,
      @JsonKey(name: 'title') String name,
      @JsonKey(name: 'time_zone') String timeZone,
      @JsonKey(name: 'street_address') String address,
      String city,
      String state,
      String country,
      @JsonKey(name: 'postal_code') String postalCode,
      String email,
      String phone,
      String latitude,
      String longitude,
      String facilities,
      @JsonKey(name: 'location_image_1') String locationImage1,
      @JsonKey(name: 'location_image_2') String? locationImage2,
      @JsonKey(name: 'location_image_3') String? locationImage3,
      @JsonKey(name: 'location_image_4') String? locationImage4,
      String logo,
      @JsonKey(name: 'membership_mandatory_before_booking')
      bool membershipMandatory,
      @JsonKey(name: 'court_count') int courtCount});
}

/// @nodoc
class _$ClubDataModelCopyWithImpl<$Res, $Val extends ClubDataModel>
    implements $ClubDataModelCopyWith<$Res> {
  _$ClubDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClubDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? masterId = null,
    Object? locationId = freezed,
    Object? currency = null,
    Object? name = null,
    Object? timeZone = null,
    Object? address = null,
    Object? city = null,
    Object? state = null,
    Object? country = null,
    Object? postalCode = null,
    Object? email = null,
    Object? phone = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? facilities = null,
    Object? locationImage1 = null,
    Object? locationImage2 = freezed,
    Object? locationImage3 = freezed,
    Object? locationImage4 = freezed,
    Object? logo = null,
    Object? membershipMandatory = null,
    Object? courtCount = null,
  }) {
    return _then(_value.copyWith(
      masterId: null == masterId
          ? _value.masterId
          : masterId // ignore: cast_nullable_to_non_nullable
              as int,
      locationId: freezed == locationId
          ? _value.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as int?,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      timeZone: null == timeZone
          ? _value.timeZone
          : timeZone // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      postalCode: null == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String,
      facilities: null == facilities
          ? _value.facilities
          : facilities // ignore: cast_nullable_to_non_nullable
              as String,
      locationImage1: null == locationImage1
          ? _value.locationImage1
          : locationImage1 // ignore: cast_nullable_to_non_nullable
              as String,
      locationImage2: freezed == locationImage2
          ? _value.locationImage2
          : locationImage2 // ignore: cast_nullable_to_non_nullable
              as String?,
      locationImage3: freezed == locationImage3
          ? _value.locationImage3
          : locationImage3 // ignore: cast_nullable_to_non_nullable
              as String?,
      locationImage4: freezed == locationImage4
          ? _value.locationImage4
          : locationImage4 // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: null == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
      membershipMandatory: null == membershipMandatory
          ? _value.membershipMandatory
          : membershipMandatory // ignore: cast_nullable_to_non_nullable
              as bool,
      courtCount: null == courtCount
          ? _value.courtCount
          : courtCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClubDataModelImplCopyWith<$Res>
    implements $ClubDataModelCopyWith<$Res> {
  factory _$$ClubDataModelImplCopyWith(
          _$ClubDataModelImpl value, $Res Function(_$ClubDataModelImpl) then) =
      __$$ClubDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'master_id') int masterId,
      @JsonKey(name: 'location_id') int? locationId,
      String currency,
      @JsonKey(name: 'title') String name,
      @JsonKey(name: 'time_zone') String timeZone,
      @JsonKey(name: 'street_address') String address,
      String city,
      String state,
      String country,
      @JsonKey(name: 'postal_code') String postalCode,
      String email,
      String phone,
      String latitude,
      String longitude,
      String facilities,
      @JsonKey(name: 'location_image_1') String locationImage1,
      @JsonKey(name: 'location_image_2') String? locationImage2,
      @JsonKey(name: 'location_image_3') String? locationImage3,
      @JsonKey(name: 'location_image_4') String? locationImage4,
      String logo,
      @JsonKey(name: 'membership_mandatory_before_booking')
      bool membershipMandatory,
      @JsonKey(name: 'court_count') int courtCount});
}

/// @nodoc
class __$$ClubDataModelImplCopyWithImpl<$Res>
    extends _$ClubDataModelCopyWithImpl<$Res, _$ClubDataModelImpl>
    implements _$$ClubDataModelImplCopyWith<$Res> {
  __$$ClubDataModelImplCopyWithImpl(
      _$ClubDataModelImpl _value, $Res Function(_$ClubDataModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClubDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? masterId = null,
    Object? locationId = freezed,
    Object? currency = null,
    Object? name = null,
    Object? timeZone = null,
    Object? address = null,
    Object? city = null,
    Object? state = null,
    Object? country = null,
    Object? postalCode = null,
    Object? email = null,
    Object? phone = null,
    Object? latitude = null,
    Object? longitude = null,
    Object? facilities = null,
    Object? locationImage1 = null,
    Object? locationImage2 = freezed,
    Object? locationImage3 = freezed,
    Object? locationImage4 = freezed,
    Object? logo = null,
    Object? membershipMandatory = null,
    Object? courtCount = null,
  }) {
    return _then(_$ClubDataModelImpl(
      masterId: null == masterId
          ? _value.masterId
          : masterId // ignore: cast_nullable_to_non_nullable
              as int,
      locationId: freezed == locationId
          ? _value.locationId
          : locationId // ignore: cast_nullable_to_non_nullable
              as int?,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      timeZone: null == timeZone
          ? _value.timeZone
          : timeZone // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      postalCode: null == postalCode
          ? _value.postalCode
          : postalCode // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      latitude: null == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as String,
      longitude: null == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as String,
      facilities: null == facilities
          ? _value.facilities
          : facilities // ignore: cast_nullable_to_non_nullable
              as String,
      locationImage1: null == locationImage1
          ? _value.locationImage1
          : locationImage1 // ignore: cast_nullable_to_non_nullable
              as String,
      locationImage2: freezed == locationImage2
          ? _value.locationImage2
          : locationImage2 // ignore: cast_nullable_to_non_nullable
              as String?,
      locationImage3: freezed == locationImage3
          ? _value.locationImage3
          : locationImage3 // ignore: cast_nullable_to_non_nullable
              as String?,
      locationImage4: freezed == locationImage4
          ? _value.locationImage4
          : locationImage4 // ignore: cast_nullable_to_non_nullable
              as String?,
      logo: null == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
      membershipMandatory: null == membershipMandatory
          ? _value.membershipMandatory
          : membershipMandatory // ignore: cast_nullable_to_non_nullable
              as bool,
      courtCount: null == courtCount
          ? _value.courtCount
          : courtCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClubDataModelImpl implements _ClubDataModel {
  const _$ClubDataModelImpl(
      {@JsonKey(name: 'master_id') required this.masterId,
      @JsonKey(name: 'location_id') this.locationId,
      required this.currency,
      @JsonKey(name: 'title') required this.name,
      @JsonKey(name: 'time_zone') required this.timeZone,
      @JsonKey(name: 'street_address') required this.address,
      required this.city,
      required this.state,
      required this.country,
      @JsonKey(name: 'postal_code') required this.postalCode,
      required this.email,
      required this.phone,
      required this.latitude,
      required this.longitude,
      required this.facilities,
      @JsonKey(name: 'location_image_1') required this.locationImage1,
      @JsonKey(name: 'location_image_2') this.locationImage2,
      @JsonKey(name: 'location_image_3') this.locationImage3,
      @JsonKey(name: 'location_image_4') this.locationImage4,
      required this.logo,
      @JsonKey(name: 'membership_mandatory_before_booking')
      required this.membershipMandatory,
      @JsonKey(name: 'court_count') required this.courtCount});

  factory _$ClubDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClubDataModelImplFromJson(json);

  @override
  @JsonKey(name: 'master_id')
  final int masterId;
  @override
  @JsonKey(name: 'location_id')
  final int? locationId;
  @override
  final String currency;
  @override
  @JsonKey(name: 'title')
  final String name;
  @override
  @JsonKey(name: 'time_zone')
  final String timeZone;
  @override
  @JsonKey(name: 'street_address')
  final String address;
  @override
  final String city;
  @override
  final String state;
  @override
  final String country;
  @override
  @JsonKey(name: 'postal_code')
  final String postalCode;
  @override
  final String email;
  @override
  final String phone;
  @override
  final String latitude;
  @override
  final String longitude;
  @override
  final String facilities;
  @override
  @JsonKey(name: 'location_image_1')
  final String locationImage1;
  @override
  @JsonKey(name: 'location_image_2')
  final String? locationImage2;
  @override
  @JsonKey(name: 'location_image_3')
  final String? locationImage3;
  @override
  @JsonKey(name: 'location_image_4')
  final String? locationImage4;
  @override
  final String logo;
  @override
  @JsonKey(name: 'membership_mandatory_before_booking')
  final bool membershipMandatory;
  @override
  @JsonKey(name: 'court_count')
  final int courtCount;

  @override
  String toString() {
    return 'ClubDataModel(masterId: $masterId, locationId: $locationId, currency: $currency, name: $name, timeZone: $timeZone, address: $address, city: $city, state: $state, country: $country, postalCode: $postalCode, email: $email, phone: $phone, latitude: $latitude, longitude: $longitude, facilities: $facilities, locationImage1: $locationImage1, locationImage2: $locationImage2, locationImage3: $locationImage3, locationImage4: $locationImage4, logo: $logo, membershipMandatory: $membershipMandatory, courtCount: $courtCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClubDataModelImpl &&
            (identical(other.masterId, masterId) ||
                other.masterId == masterId) &&
            (identical(other.locationId, locationId) ||
                other.locationId == locationId) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.timeZone, timeZone) ||
                other.timeZone == timeZone) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.postalCode, postalCode) ||
                other.postalCode == postalCode) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude) &&
            (identical(other.facilities, facilities) ||
                other.facilities == facilities) &&
            (identical(other.locationImage1, locationImage1) ||
                other.locationImage1 == locationImage1) &&
            (identical(other.locationImage2, locationImage2) ||
                other.locationImage2 == locationImage2) &&
            (identical(other.locationImage3, locationImage3) ||
                other.locationImage3 == locationImage3) &&
            (identical(other.locationImage4, locationImage4) ||
                other.locationImage4 == locationImage4) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.membershipMandatory, membershipMandatory) ||
                other.membershipMandatory == membershipMandatory) &&
            (identical(other.courtCount, courtCount) ||
                other.courtCount == courtCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        masterId,
        locationId,
        currency,
        name,
        timeZone,
        address,
        city,
        state,
        country,
        postalCode,
        email,
        phone,
        latitude,
        longitude,
        facilities,
        locationImage1,
        locationImage2,
        locationImage3,
        locationImage4,
        logo,
        membershipMandatory,
        courtCount
      ]);

  /// Create a copy of ClubDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClubDataModelImplCopyWith<_$ClubDataModelImpl> get copyWith =>
      __$$ClubDataModelImplCopyWithImpl<_$ClubDataModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClubDataModelImplToJson(
      this,
    );
  }
}

abstract class _ClubDataModel implements ClubDataModel {
  const factory _ClubDataModel(
      {@JsonKey(name: 'master_id') required final int masterId,
      @JsonKey(name: 'location_id') final int? locationId,
      required final String currency,
      @JsonKey(name: 'title') required final String name,
      @JsonKey(name: 'time_zone') required final String timeZone,
      @JsonKey(name: 'street_address') required final String address,
      required final String city,
      required final String state,
      required final String country,
      @JsonKey(name: 'postal_code') required final String postalCode,
      required final String email,
      required final String phone,
      required final String latitude,
      required final String longitude,
      required final String facilities,
      @JsonKey(name: 'location_image_1') required final String locationImage1,
      @JsonKey(name: 'location_image_2') final String? locationImage2,
      @JsonKey(name: 'location_image_3') final String? locationImage3,
      @JsonKey(name: 'location_image_4') final String? locationImage4,
      required final String logo,
      @JsonKey(name: 'membership_mandatory_before_booking')
      required final bool membershipMandatory,
      @JsonKey(name: 'court_count')
      required final int courtCount}) = _$ClubDataModelImpl;

  factory _ClubDataModel.fromJson(Map<String, dynamic> json) =
      _$ClubDataModelImpl.fromJson;

  @override
  @JsonKey(name: 'master_id')
  int get masterId;
  @override
  @JsonKey(name: 'location_id')
  int? get locationId;
  @override
  String get currency;
  @override
  @JsonKey(name: 'title')
  String get name;
  @override
  @JsonKey(name: 'time_zone')
  String get timeZone;
  @override
  @JsonKey(name: 'street_address')
  String get address;
  @override
  String get city;
  @override
  String get state;
  @override
  String get country;
  @override
  @JsonKey(name: 'postal_code')
  String get postalCode;
  @override
  String get email;
  @override
  String get phone;
  @override
  String get latitude;
  @override
  String get longitude;
  @override
  String get facilities;
  @override
  @JsonKey(name: 'location_image_1')
  String get locationImage1;
  @override
  @JsonKey(name: 'location_image_2')
  String? get locationImage2;
  @override
  @JsonKey(name: 'location_image_3')
  String? get locationImage3;
  @override
  @JsonKey(name: 'location_image_4')
  String? get locationImage4;
  @override
  String get logo;
  @override
  @JsonKey(name: 'membership_mandatory_before_booking')
  bool get membershipMandatory;
  @override
  @JsonKey(name: 'court_count')
  int get courtCount;

  /// Create a copy of ClubDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClubDataModelImplCopyWith<_$ClubDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
