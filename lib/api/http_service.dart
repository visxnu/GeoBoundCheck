import 'package:attendance_management/api/end_points.dart';
import 'package:dio/dio.dart';

class HttpService {
  late Dio dio;
  static final HttpService _singleton = HttpService._internal();

  HttpService._internal() {
    dio = Dio(BaseOptions(
      baseUrl: EndPoints.baseUrl1,
      connectTimeout: const Duration(milliseconds: 20000),
      receiveTimeout: const Duration(milliseconds: 30000),
      // followRedirects: true,
    ));
    dio.interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    initializeInterceptors();
  }

  factory HttpService() {
    return _singleton;
  }

  dynamic initializeInterceptors() {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: null,
      onResponse: (response, handler) {
        return handler.next(response);
      },
    ));
  }

  Future<Response> getRequest(String endPoint,
      [Map<String, dynamic>? queryParameters]) async {
    Response response;

    try {
      response =
          await dio.get<String>(endPoint, queryParameters: queryParameters);
    } on DioException catch (exception) {
      response = getErrorResponseOnException(exception);
    }

    return response;
  }

  Future<Response> postRequest(String endPoint, dynamic data,
      [Map<String, dynamic>? queryParameters]) async {
    Response response;

    try {
      response = await dio.post<String>(endPoint,
          data: data, queryParameters: queryParameters);
    } on DioException catch (exception) {
      response = getErrorResponseOnException(exception);
    }

    return response;
  }

  Response getErrorResponseOnException(DioException exception) {
    String? errorMessage = "";

    return Response(
        data: exception.response?.data,
        requestOptions: exception.requestOptions,
        statusCode: exception.response?.statusCode,
        statusMessage: errorMessage);
  }

  onRequest(RequestOptions options, handler) async {
    // final token = await UserSession.fetchCognitoAuthSession();
    // if (token != null) {
    //   options.headers["Authorization"] = "Bearer $token";
    // }
    // options.headers["Platform"] = Platform.isIOS ? "iOS" : "Android";
    // // options.headers["AppVersion"] = await Utils.getAppVersion();
    // // options.headers["DeviceID"] = await Utils.getDeviceId();
    // return handler.next(options);
  }
}
