import 'package:bill_keep/bindings/board_binding.dart';
import 'package:bill_keep/bindings/root_screen_binding.dart';
import 'package:bill_keep/bindings/user_binding.dart';
import 'package:bill_keep/module/item/item_binding.dart';
import 'package:bill_keep/module/item/item_view.dart';
import 'package:bill_keep/views/board_screen/board_screen.dart';
import 'package:bill_keep/views/dashboard.dart';
import 'package:bill_keep/views/home_screen/home_screen.dart';
import 'package:bill_keep/views/login_screen/login_screen.dart';
import 'package:bill_keep/views/root_screen.dart';
import 'package:get/get.dart';

final List<GetPage> appPages = [
  GetPage(
    name: RootScreen.routeName,
    page: () => RootScreen(),
    binding: RootScreenBinding(),
  ),
  GetPage(
    name: LoginScreen.routeName,
    page: () => LoginScreen(),
  ),
  GetPage(
    name: Dashboard.routeName,
    page: () => Dashboard(),
  ),
  GetPage(
    name: HomeScreen.routeName,
    page: () => HomeScreen(),
    binding: UserBinding(),
  ),
  GetPage(
    name: BoardScreen.routeName,
    page: () => BoardScreen(),
    binding: BoardBinding(),
  ),
  GetPage(
    name: ItemViewPage.routeName,
    page: () => ItemViewPage(),
    binding: ItemBinding(),
  ),
];
