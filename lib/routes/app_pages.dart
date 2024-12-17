import 'package:get/get.dart';
import 'package:projectmobile/app/controller/setting_controller.dart';
import 'package:projectmobile/app/presentation/Logreg/loginpage.dart';
import 'package:projectmobile/app/presentation/Logreg/registerpage.dart';
import 'package:projectmobile/app/presentation/Logreg/regverif.dart';
import 'package:projectmobile/app/presentation/dashboard/dashboard.dart';
import 'package:projectmobile/app/presentation/Logreg/startpage.dart';
import 'package:projectmobile/app/presentation/cart/topuppage.dart';
import 'package:projectmobile/app/profile/edit_profile.dart';
import 'package:projectmobile/app/profile/pusat_bantuan.dart';
import 'package:projectmobile/app/presentation/Logreg/lupapassword.dart';
import '../app/Profile/settings.dart';

import 'routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.welcome,
      page: () => const StartPage(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: AppRoutes.lupapassword,
      page: () => const LupaPasswordPage(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => const RegisterPage(),
    ),
    GetPage(
      name: AppRoutes.registerVerification,
      page: () => const Regverif(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const Dashboard(),
    ),
    GetPage(
      name: AppRoutes.helpCenter,
      page: () => const PusatBantuanPage(),
    ),
    GetPage(
      name: AppRoutes.topUp,
      page: () => const TopUpPage(),
    ),
    GetPage(
      name: AppRoutes.setting,
      page: () => const SettingsScreen(),
      binding: BindingsBuilder((){
        Get.put(SettingsController());
      }),
    ),
    GetPage(
      name: AppRoutes.editProfile,
      page: () => const EditProfile(),
    ),
  ];
}
