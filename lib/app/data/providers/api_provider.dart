import 'package:get/get.dart';

import '../../app_utils/common/custom_trace.dart';


mixin ApiClient {
  String? baseUrl;

  String getBaseUrl(String path) {
    if (!path.endsWith('/')) {
      path += '/';
    }
    if (path.startsWith('/')) {
      path = path.substring(1);
    }
    if (!baseUrl!.endsWith('/')) {
      return '${baseUrl!}/$path';
    }
    return baseUrl! + path;
  }

  String getApiBaseUrl(String path) {
    String apiPath = "";
    if (path.startsWith('/')) {
      return getBaseUrl(apiPath) + path.substring(1);
    }
    return getBaseUrl(apiPath) + path;
  }

  Uri getApiBaseUri(String path) {
    return Uri.parse(getApiBaseUrl(path));
  }

  Uri getBaseUri(String path) {
    return Uri.parse(getBaseUrl(path));
  }

  void printUri(StackTrace stackTrace, Uri uri) {
    Get.log(CustomTrace(stackTrace, message: uri.toString()).toString());
  }
}
