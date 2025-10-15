
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:dio/io.dart';

import '../../app_utils/common/custom_trace.dart';
import '../../di/exceptions/network_exceptions.dart';

const _defaultConnectTimeout = Duration.minutesPerHour;
const _defaultReceiveTimeout = Duration.minutesPerHour;

class DioClient {
  final String baseUrl;

  Dio? _dio;
  Options? optionsNetwork;
  Options? optionsCache;
  final List<Interceptor>? interceptors;
  final _progress = <String>[].obs;

  DioClient(
    this.baseUrl,
    Dio dio, {
    this.interceptors,
  }) {
    _dio = dio;
    _dio?..options.baseUrl = baseUrl
      ..httpClientAdapter
      ..options.connectTimeout = Duration(minutes: _defaultConnectTimeout) // 5-minute timeout
      ..options.receiveTimeout = Duration(minutes: _defaultReceiveTimeout) // 5-minute timeout
      ..options.headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept-Language': 'en',
        'X-Requested-With': 'XMLHttpRequest',
      } ..interceptors.add(Interceptor());

    if (interceptors?.isNotEmpty ?? false) {
      _dio?.interceptors.addAll(interceptors!);
    }
    if (kDebugMode) {
      _dio?.interceptors.add(LogInterceptor(responseBody: true, error: true, requestHeader: false, responseHeader: false, request: false, requestBody: false));
      // _dio?.interceptors.add(FetchInterceptor());
    }
    optionsNetwork = Options(headers: _dio?.options.headers);
    optionsCache = Options(headers: _dio?.options.headers);
    // Get.log(optionsNetwork.toString());
    // Get.log("TestStuff ${_dio?.options.headers}");
    if (!kIsWeb && !kDebugMode) {
      // optionsNetwork = buildCacheOptions(const Duration(days: 3), forceRefresh: true, options: optionsNetwork);
      // optionsCache = buildCacheOptions(const Duration(minutes: 10), forceRefresh: false, options: optionsCache);
      // _dio?.interceptors.add(DioCacheManager(CacheConfig(baseUrl: baseUrl)).interceptor);
    }
    // (_dio?.httpClientAdapter as IOHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
    //   return client;
    // };
  }

  Future<dynamic> get(
      String uri, {
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onReceiveProgress,
      }) async {
    try {
      var response = await _dio?.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;

    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      throw NetworkExceptions.getDioException(e);
    }
  }

  Future<dynamic> getUri(
      Uri uri, {
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onReceiveProgress,
      }) async {
    CustomTrace programInfo = CustomTrace(StackTrace.current);
    try {
      _startProgress(programInfo);
      var response = await _dio?.getUri(
        uri,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      _endProgress(programInfo);
      return response;

    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } on FlutterError catch (e) {
      if (kDebugMode) {
        print(e.runtimeType);
      }
    } on DioException catch (e) {
      return e.response;
    } finally {
      _endProgress(programInfo);
    }
  }

  Future<dynamic> post(
      String uri, {
        data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async {
    try {
      var response = await _dio?.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      throw NetworkExceptions.getDioException(e);
    }
  }

  Future<dynamic> postUri(
      Uri uri, {
        data,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async {
    CustomTrace programInfo = CustomTrace(StackTrace.current);
    try {
      _startProgress(programInfo);
      var response = await _dio?.postUri(
        uri,
        data: data,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      _endProgress(programInfo);
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      throw NetworkExceptions.getDioException(e);
    } finally {
      _endProgress(programInfo);
    }
  }

  Future<dynamic> put(
      String uri, {
        data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async {
    try {
      var response = await _dio?.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      throw NetworkExceptions.getDioException(e);
    }
  }

  Future<dynamic> putUri(
      Uri uri, {
        data,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async {
    CustomTrace programInfo = CustomTrace(StackTrace.current);
    try {
      _startProgress(programInfo);
      var response = await _dio?.putUri(
        uri,
        data: data,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      _endProgress(programInfo);
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      throw NetworkExceptions.getDioException(e);
    } finally {
      _endProgress(programInfo);
    }
  }

  Future<dynamic> patch(
      String uri, {
        data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async {
    try {
      var response = await _dio?.patch(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      throw NetworkExceptions.getDioException(e);
    }
  }

  Future<dynamic> patchUri(
      Uri uri, {
        data,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async {
    CustomTrace programInfo = CustomTrace(StackTrace.current);
    try {
      _startProgress(programInfo);
      var response = await _dio?.patchUri(
        uri,
        data: data,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      _endProgress(programInfo);
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      throw NetworkExceptions.getDioException(e);
    } finally {
      _endProgress(programInfo);
    }
  }

  Future<dynamic> delete(
      String uri, {
        data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
      }) async {
    try {
      var response = await _dio?.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      throw NetworkExceptions.getDioException(e);
    }
  }

  Future<dynamic> deleteUri(
      Uri uri, {
        data,
        Options? options,
        CancelToken? cancelToken,
      }) async {
    CustomTrace programInfo = CustomTrace(StackTrace.current);
    try {
      _startProgress(programInfo);
      var response = await _dio?.deleteUri(
        uri,
        data: data,
        options: options,
        cancelToken: cancelToken,
      );
      _endProgress(programInfo);
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      throw NetworkExceptions.getDioException(e);
    } finally {
      _endProgress(programInfo);
    }
  }

  bool isLoading({required String task, required List<String> tasks}) {
    return _progress.any((task) => _progress.contains(task));
  }

  void _startProgress(CustomTrace programInfo) {
    try {
      _progress.add(_getTaskName(programInfo));
    } on FlutterError {}
  }

  void _endProgress(CustomTrace programInfo) {
    try {
      _progress.remove(_getTaskName(programInfo));
    } on FlutterError {}
  }

  String _getTaskName(CustomTrace programInfo) {
    return programInfo.callerFunctionName!.split('.')[1];
  }


}



