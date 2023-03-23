import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:max_checkin/pages/home/home_page_viewmodel.dart';

import 'components/splash_screen.dart';
import 'controller/theme.dart';
import 'pages/auth/auth_viewmodel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final providers = [
    ChangeNotifierProvider<AuthViewModel>(create: (_) => AuthViewModel()),
    ChangeNotifierProvider<HomeViewModel>(create: (_) => HomeViewModel()),
  ];

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);

          return ScreenUtilInit(
              designSize: const Size(360, 690),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (context, child) {
                return MultiProvider(
                  providers: providers,
                  child: GetMaterialApp(
                    debugShowCheckedModeBanner: false,
                    initialRoute: '/',
                    getPages: [
                      GetPage(name: '/', page: () => const SplashScreen()),
                      // GetPage(name: '/signin', page: () => const SignIn())
                    ],
                  ),
                );
              });
        },
      );
}
