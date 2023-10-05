part of auth;

@RestApi()
abstract class AuthApi {
  factory AuthApi() => _AuthApi(AppApi.client);

  @POST('/auth/sign-in')
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);

  @POST('/auth/sign-up')
  Future<SignupResponse> signUp(@Body() SignupRequest signupRequest);

  @PATCH('person/{id}/b-user-profile')
  Future<SignupResponse> bUserResponse(
    @Path("id") String id,
    @Body() BUserProfileRequest bUserProfileRequest,
  );

  @POST('/save-image')
  Future<UploadImageResponse> uploadImage(@Part() File image);
}
