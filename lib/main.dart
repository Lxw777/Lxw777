import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todolist/app/data/provideData/darkThemeProvider.dart';
import 'package:todolist/app/data/provideData/userInfoProvider.dart';
import 'package:todolist/app/data/store/sevices.dart';
import 'package:todolist/controller/middleware/MiddleWare.dart';
import 'package:todolist/controller/home/binding.dart';

import 'package:todolist/app/pages/intro.dart';
import 'package:todolist/app/widgets/myApplication.dart';

SharedPreferences? preferences;

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  preferences = await SharedPreferences.getInstance();
  await GetStorage.init();
  await Get.putAsync(() => StoreService().init());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: DarkThemeProvider()),
        ChangeNotifierProvider.value(value: UserInfoProvider()),
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (context, value, child) => GetMaterialApp(
          theme: value.lightTheme,
          darkTheme: value.darkTheme,
          themeMode: value.readMode(),
          debugShowCheckedModeBanner: false,
          initialBinding: HomeBinding(),
          builder: EasyLoading.init(),
          getPages: [
            GetPage(
                name: '/',
                page: () => Intro(),
                middlewares: [IntroMeddleWare()]),
            GetPage(name: '/Demo', page: () => MyApplication())
          ],
        ),
      ),
    );
  }
}
