import 'package:get/route_manager.dart';

class AppNavigator {
  static Future<dynamic>? toNamed(String route,
      {dynamic arguments, dynamic id}) async {
    return await Get.toNamed(route, arguments: arguments, id: id);
  }

  static goBack<T>({T? result, dynamic id}) {
    Get.back(result: result);
  }

  static Future<dynamic>? offAllNamed(String route, {dynamic arguments}) async {
    return await Get.offAllNamed(route, arguments: arguments);
  }
}
