import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_state_management/app/di/injection_container.dart';
import 'package:flutter_state_management/app/modules/pageNotFound/views/page_not_found_view.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ));

    return GetMaterialApp(
      title: 'GetX Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(platform: TargetPlatform.iOS),
      defaultTransition: Transition.cupertino,

      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      unknownRoute:
      GetPage(name: "/not-found", page: () => const PageNotFoundView()),
    );
  }
}

