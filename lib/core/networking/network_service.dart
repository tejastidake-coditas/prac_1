import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:logger/web.dart';
import 'package:prac_1/core/networking/failure_constants.dart';
import 'package:prac_1/core/networking/network_constants.dart';
import 'package:prac_1/core/utils/enums/method_enum.dart';

class NetworkService {
  late final Dio _dio;
  late Logger _logger;

  NetworkService() {
    late final _headers = {'Content-Type': NetworkConstants.contentType};

    final BaseOptions _baseOptions = BaseOptions(
      baseUrl: NetworkConstants.baseUrl,
      headers: _headers,
      connectTimeout: NetworkConstants.connectTimeout,
      receiveTimeout: NetworkConstants.recieveTimeout,
    );

    _dio = Dio(_baseOptions);
    _logger = Logger();

    _initInterceptors();
  }

  void _initInterceptors() {
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: onRequest,
      onResponse: onResponse,
      onError: onError,
    ));
  }

  dynamic onRequest(RequestOptions requestOptions, handler) {
    _logger.i('${requestOptions.method} & Data: ${requestOptions.data}');
    return handler.next(requestOptions);
  }

  dynamic onResponse(Response response, handler) {
    _logger.i('${response.requestOptions.method} & Data: ${response.requestOptions.data}');
    return handler.next(response);
  }

  dynamic onError(DioException err, handler) {
    _logger.e('$err & Data: ${err.message}');
    return handler.next(err);
  }

  Future<Either<Failure, Response<dynamic>>> request(
    String endPoint,
    Method method
  ) async {
    Response response;
    
    try {
      switch (method) {
        case Method.get:
          response = await _dio.get(NetworkConstants.productEndPoint);
          break;
      }
      if (response.statusCode! >= 200 && response.statusCode! < 300){
        return Right(response);
      }
      else if (response.statusCode! > 400 && response.statusCode! < 500){
        return Left(ServiceError(message: 'Service Error', statusCode: 404));
      }
      else {
        return Left(UnknownFailure());
      }
    }
    on DioException catch (e) {
      return Left(CustomFailure(e.toString()));
    }    
  }
}
