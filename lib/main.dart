import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pinterest_clone/homeView.dart';
import 'package:pinterest_clone/mainView.dart';
import 'package:pinterest_clone/pages/loginPage.dart';
import 'package:pinterest_clone/pages/sign_up.dart';
import 'package:pinterest_clone/splash_page.dart';
import 'package:pinterest_clone/view/HomePage/homePage.dart';
import 'Model/photoModel.dart';
import 'core/constans/app_init.dart';
import 'core/storage/storage.dart';

void main() async {

  AppInit.configLoading();
// WidgetsFlutterBinding.ensureInitialized();
// await Firebase.initializeApp();
  await Hive.initFlutter();

  Hive.registerAdapter(PhotoModelAdapter());
  Hive.registerAdapter(PhotoModelLinksAdapter());
  Hive.registerAdapter(TopicSubmissionsAdapter());
  Hive.registerAdapter(HealthAdapter());
  Hive.registerAdapter(UrlsAdapter());
  // Hive.registerAdapter(UrlsAdapter());
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(UserLinksAdapter());
  Hive.registerAdapter(ProfileImageAdapter());
  Hive.registerAdapter(SocialAdapter());

  box = await Hive.openBox('box');
  AppInit.configLoading();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: EasyLoading.init(),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  const MainView(),
      routes: {
        // '/SignUp' : (context) => const SignUpPage(),
        // '/SignIn' : (context) => const LoginPage(),
        '/MainView' : (context) => const MainView(),
      },
    );
  }
}