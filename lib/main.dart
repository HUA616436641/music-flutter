import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'lang/translation_service.dart';
import 'pages/splash/bindings/main_binding.dart';
import 'routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: false,
      initialBinding: MainBinding(),
      // logWriterCallback: Logger.write,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      locale: TranslationService.locale,
      fallbackLocale: TranslationService.fallbackLocale,
      translations: TranslationService(),
    );
  }
}
