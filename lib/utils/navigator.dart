import 'package:get/route_manager.dart';
import 'package:open_weather/utils/routes.dart';

import '../app/features/home_page/presentation/pages/home_page.dart';

class PagesNavigator {
  PagesNavigator._();

  static final pages = [
    GetPage(
      name: Routes.homePage,
      page: () => const HomePage(),
    )
  ];
}
