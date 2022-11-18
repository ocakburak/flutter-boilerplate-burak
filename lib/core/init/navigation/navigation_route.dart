import 'package:flutter/material.dart';
import '../../../view/home/view/home_view.dart';
import '../../../view/test/view/test_view.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.homeView:
        return normalNavigate(const HomeView(), NavigationConstants.homeView);

      case NavigationConstants.testView:
        return normalNavigate(const TestView(), NavigationConstants.testView);

      case NavigationConstants.settingView:
      // return normalNavigate(TestsView(), NavigationConstants.settingView);

      case NavigationConstants.loginView:
      // return normalNavigate(LoginView(), NavigationConstants.loginView);

      default:
        return MaterialPageRoute(
          builder: (context) => const NotFoundNavigationWidget(),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget, String pageName) {
    return MaterialPageRoute(
        builder: (context) => widget, settings: RouteSettings(name: pageName));
  }
}

class NotFoundNavigationWidget extends StatelessWidget {
  const NotFoundNavigationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Böyle bir sayfa bulunmamaktadır!"));
  }
}
