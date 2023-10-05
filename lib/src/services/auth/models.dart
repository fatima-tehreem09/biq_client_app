part of auth;

/// login response and request models:
@JsonSerializable(createFactory: false)

/// we do not need fromJson of login request model.Hence, [createFactory] is false
class LoginRequest {
  LoginRequest({
    required this.password,
    required this.email,
  });

  String email;
  String password;

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}

@JsonSerializable(createToJson: false)
class LoginResponse {
  LoginResponse({
    required this.accessToken,
  });

  factory LoginResponse.fromJson(json) => _$LoginResponseFromJson(json);

  /// we use our own name of keys and to do that we use jsonKey(name:'name of key in api')
  @JsonKey(name: 'access_token')
  final String accessToken;
}

@JsonSerializable(createFactory: false)
class SignupRequest {
  int? role;
  String? username,
      password,
      name,
      createdBy,
      email,
      positionAtWork,
      contact,
      address,
      image,
      loginVia;
  bool? isBusinessUser;

  List<String>? scopes;

  SignupRequest(
      {this.role,
      this.username,
      this.password,
      this.name,
      this.createdBy,
      this.email,
      this.positionAtWork,
      this.contact,
      this.address,
      this.image,
      this.loginVia,
      this.isBusinessUser,
      this.scopes});

  Map<String, dynamic> toJson() => _$SignupRequestToJson(this);
}

@JsonSerializable(createToJson: false)
class SignupResponse {
  String? email,
      name,
      loginVia,
      positionAtWork,
      verificationHash,
      createdAt,
      updatedAt;
  bool? isVerified,
      hasTermsAccepted,
      status,
      isBusinessUser,
      isBUserPasswordSet;
  @JsonKey(name: "_id")
  String? id;

  List<String>? scopes;

  @JsonKey(name: "__v")
  int? v;
  int? role;

  SignupResponse(
      {this.email,
      this.name,
      this.loginVia,
      this.positionAtWork,
      this.verificationHash,
      this.createdAt,
      this.updatedAt,
      this.isVerified,
      this.hasTermsAccepted,
      this.status,
      this.isBusinessUser,
      this.isBUserPasswordSet,
      this.id,
      this.scopes,
      this.v,
      this.role});

  factory SignupResponse.fromJson(json) => _$SignupResponseFromJson(json);
}

// @JsonSerializable(createFactory: false)
// class UploadImageRequest {
//   XFile? image;
//
//   UploadImageRequest({this.image});
//
//   Map<String, dynamic> toJson() => _$UploadImageRequestToJson(this);
// }

@JsonSerializable(createToJson: false)
class UploadImageResponse {
  String? path, name;

  UploadImageResponse({this.path, this.name});

  factory UploadImageResponse.fromJson(json) =>
      _$UploadImageResponseFromJson(json);
}

@JsonSerializable(createFactory: false)
class BUserProfileRequest {
  String? image, password;

  BUserProfileRequest({this.image, this.password});

  Map<String, dynamic> toJson() => _$BUserProfileRequestToJson(this);
}

// @JsonSerializable(createToJson: false)
// class BUserProfileResponse {
//   String? email,
//       name,
//       loginVia,
//       positionAtWork,
//       verificationHash,
//       createdAt,
//       updatedAt;
//   bool? isVerified,
//       hasTermsAccepted,
//       status,
//       isBusinessUser,
//       isBUserPasswordSet;
//   @JsonKey(name: "_id")
//   String? id;
//
//   List<String>? scopes;
//
//   @JsonKey(name: "__v")
//   int? v;
//   int? role;
//
//   BUserProfileResponse(
//       {this.email,
//       this.name,
//       this.loginVia,
//       this.positionAtWork,
//       this.verificationHash,
//       this.createdAt,
//       this.updatedAt,
//       this.isVerified,
//       this.hasTermsAccepted,
//       this.status,
//       this.isBusinessUser,
//       this.isBUserPasswordSet,
//       this.id,
//       this.scopes,
//       this.v,
//       this.role});
//
//   factory BUserProfileResponse.fromJson(json) =>
//       _$BUserProfileResponseFromJson(json);
// }
