import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class Remote {
  late Dio dio;
  Remote(String url) {
    final options = BaseOptions(
      baseUrl: url,
        headers: {
        'x-api-key': 'QUtFhHPnlQ5f13LDVpQL3a54XgQzTlCJa1PMSB3o'
      },
      receiveDataWhenStatusError: true,
      connectTimeout: 60 * 1000, // 60 seconds
      receiveTimeout: 60 * 1000, // 60 seconds
    );

    dio = Dio(options);
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
      ),
    );
    dio.interceptors.add(InterceptorsWrapper(onRequest: (
      options,
      handler,
    ) async {
      handler.next(options);
    }));
  }
}
