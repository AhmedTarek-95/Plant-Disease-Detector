import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:plant_disease_detector/services/disease_provider.dart';
import 'package:plant_disease_detector/src/login_page/Login_Plants.dart';
import 'package:plant_disease_detector/src/login_page/about_page.dart';
import 'package:plant_disease_detector/src/home_page/home.dart';
import 'package:plant_disease_detector/src/home_page/models/disease_model.dart';
import 'package:plant_disease_detector/src/suggestions_page/suggestions.dart';
import 'package:plant_disease_detector/src/login_page/change_email.dart';
import 'package:plant_disease_detector/src/login_page/change_password.dart';
import 'package:plant_disease_detector/src/login_page/name_page.dart';
import 'package:plant_disease_detector/src/login_page/user_page.dart';

import 'package:provider/provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(DiseaseAdapter());

  await Hive.openBox<Disease>('plant_diseases');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DiseaseService>(
      create: (context) => DiseaseService(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Detect diseases',
        theme: ThemeData(primarySwatch: Colors.green, fontFamily: 'SFRegular'),
        onGenerateRoute: (RouteSettings routeSettings) {
          return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case Suggestions.routeName:
                    return const Suggestions();
                  case AboutPage.aboutPage: // Add this case for the new page
                    return AboutPage();
                  case LoginPlants.loginPlants: // Add this case for the new page
                    return LoginPlants();
                  case UserPage.userPage: // Add this case for the new page
                    return UserPage();
                  case ChangePass.changePass: // Add this case for the new page
                    return ChangePass();
                  case ChangeEmail.changeEmail: // Add this case for the new page
                    return ChangeEmail();
                  case NamePage.namePage: // Add this case for the new page
                    return NamePage();
                  case Home.routeName:
                  default:
                    return const Home();
                }
              });
        },
      ),
    );
  }
}

