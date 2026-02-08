import 'package:dio/dio.dart';
import 'package:freetalk/core/network/api_constans.dart';
import 'package:freetalk/data/model/login_request_body.dart';
import 'package:freetalk/data/model/login_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequestBody requestBody);
}
