import 'package:coinbase/modules/coin/bindings/coin_binding.dart';
import 'package:coinbase/modules/coin/views/coin_view.dart';
import 'package:coinbase/modules/home_page/bindings/home_binding.dart';
import 'package:coinbase/modules/home_page/views/home_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
        name: Routes.HOME_PAGE, page: () => HomeView(), binding: HomeBinding()),
    GetPage(
        name: Routes.COIN_VIEW, page: () => CoinView(), binding: CoinBinding())
  ];
}
