import 'package:get/get.dart';

import '../../../core/constants/navigation/navigation_constants.dart';
import '../../../core/init/navigation/navigation_service.dart';

class HomeViewModel extends GetxController {
  var number = 0.obs;

  void increment() {
    number++;
  }

  void navigateToTestView() {
    NavigationService.instance
        .navigateToPage(path: NavigationConstants.testView);
  }
}
