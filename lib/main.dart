import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:patient/Ui/Screens/Splash/SplashScreen.dart';
import 'package:skeletons/skeletons.dart';
import 'Core/Helper/Helper.dart';
import 'Style/app_theme.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GetMaterialApp(
    theme: AppTheme.appTheme,
    supportedLocales: const [
      Locale('en'),
      Locale('ar')
      ],

    home:

      SkeletonTheme(
      // themeMode: ThemeMode.light,
        shimmerGradient: const LinearGradient(
          colors: [
            Color(0xFFD8E3E7),
            Color(0xFFC8D5DA),
            Color(0xFFD8E3E7),
          ],
          stops: [
            0.1,
            0.5,
            0.9,
          ],
        ),
        darkShimmerGradient: const LinearGradient(
          colors: [
            Color(0xFF222222),
            Color(0xFF242424),
            Color(0xFF2B2B2B),
            Color(0xFF242424),
            Color(0xFF222222),
          ],
          stops: [
            0.0,
            0.2,
            0.5,
            0.8,
            1,
          ],
          begin: Alignment(-2.4, -0.2),
          end: Alignment(2.4, 0.2),
          tileMode: TileMode.clamp,
        ),
        child:FutureBuilder(future:Helper.helperInit() ,builder: (context, snapshot) {
  if(snapshot.hasData) {
    return const SplashScreen();
  }else{
    return Scaffold(appBar:AppBar());

  }
},)
    ),
    debugShowCheckedModeBanner: false,
    navigatorKey: Helper.materialKey, ));

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}
