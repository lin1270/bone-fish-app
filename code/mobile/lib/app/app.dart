import 'package:flutter/material.dart';
import 'package:bonefishapp/app/home_page/homePage.dart';
import 'package:bonefishapp/common/config/app.dart';

class BoneFishApp extends StatelessWidget {
  const BoneFishApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Config.themeColor,
        brightness: Brightness.light, //控件颜色模式dark
        primaryColor: Colors.black, //设置主题色为黑色即可
      ),
      home: const HomePage(title: 'bone-fish-app'),
    );
  }
}
