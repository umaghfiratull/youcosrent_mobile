import 'package:get/get.dart';

import '../modules/address/bindings/address_binding.dart';
import '../modules/address/views/address_view.dart';
import '../modules/address_field/bindings/address_field_binding.dart';
import '../modules/address_field/views/address_field_view.dart';
import '../modules/detail/bindings/detail_binding.dart';
import '../modules/detail/views/detail_view.dart';
import '../modules/favorite/bindings/favorite_binding.dart';
import '../modules/favorite/views/favorite_view.dart';
import '../modules/history/bindings/history_binding.dart';
import '../modules/history/views/history_view.dart';
import '../modules/history_myOrder/bindings/history_my_order_binding.dart';
import '../modules/history_myOrder/views/history_my_order_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/info/bindings/info_binding.dart';
import '../modules/info/views/info_view.dart';
import '../modules/keranjang/bindings/keranjang_binding.dart';
import '../modules/keranjang/views/keranjang_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/navigation/bindings/navigation_binding.dart';
import '../modules/navigation/views/navigation_view.dart';
import '../modules/pesanan_myOrder/bindings/pesanan_my_order_binding.dart';
import '../modules/pesanan_myOrder/views/pesanan_my_order_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/setting/bindings/setting_binding.dart';
import '../modules/setting/views/setting_view.dart';
import '../modules/sewa/bindings/sewa_binding.dart';
import '../modules/sewa/views/sewa_view.dart';
import '../modules/splashscreen/bindings/splashscreen_binding.dart';
import '../modules/splashscreen/views/splashscreen_view.dart';
import '../modules/testing/bindings/testing_binding.dart';
import '../modules/testing/views/testing_view.dart';
import '../modules/transaksi/bindings/transaksi_binding.dart';
import '../modules/transaksi/views/transaksi_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASHSCREEN;
  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => const SplashscreenView(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.NAVIGATION,
      page: () => NavigationView(),
      binding: NavigationBinding(),
    ),
    GetPage(
      name: _Paths.TESTING,
      page: () => const TestingView(),
      binding: TestingBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL,
      page: () => DetailView(),
      binding: DetailBinding(),
    ),
    GetPage(
      name: _Paths.KERANJANG,
      page: () => KeranjangView(),
      binding: KeranjangBinding(),
    ),
    GetPage(
      name: _Paths.SEWA,
      page: () => SewaView(),
      binding: SewaBinding(),
    ),
    GetPage(
      name: _Paths.FAVORITE,
      page: () => FavoriteView(),
      binding: FavoriteBinding(),
    ),
    GetPage(
      name: _Paths.SETTING,
      page: () => const SettingView(),
      binding: SettingBinding(),
    ),
    GetPage(
      name: _Paths.INFO,
      page: () => InfoView(),
      binding: InfoBinding(),
    ),
    GetPage(
      name: _Paths.ADDRESS,
      page: () => AddressView(),
      binding: AddressBinding(),
    ),
    GetPage(
      name: _Paths.ADDRESS_FIELD,
      page: () => AddressFieldView(),
      binding: AddressFieldBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY,
      page: () => HistoryView(),
      binding: HistoryBinding(),
    ),
    GetPage(
      name: _Paths.TRANSAKSI,
      page: () => TransaksiView(selectedItems: [], groupKey: ''),
      binding: TransaksiBinding(),
    ),
    GetPage(
      name: _Paths.PESANAN_MY_ORDER,
      page: () => PesananMyOrderView(),
      binding: PesananMyOrderBinding(),
    ),
    GetPage(
      name: _Paths.HISTORY_MY_ORDER,
      page: () => HistoryMyOrderView(),
      binding: HistoryMyOrderBinding(),
    ),
  ];
}
