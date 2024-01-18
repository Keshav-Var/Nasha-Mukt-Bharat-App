import 'package:flutter/material.dart';
import 'package:mini_project/homepage/home_page.dart';
import 'package:mini_project/pages/article_page.dart';
import 'package:mini_project/pages/book_appointment_page.dart';
import 'package:mini_project/pages/login_page.dart';
import 'package:mini_project/pages/my_records_page.dart';
import 'package:mini_project/pages/prescriptoin_page.dart';
import 'package:mini_project/pages/upload_doc.dart';
import 'package:mini_project/routes/routes.dart';
import 'package:mini_project/homepage/splash_screen.dart';

Route<dynamic> getRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.splash:
      return buildRoute(const SplashScreen(), settings: settings);
    case AppRoutes.home:
      return buildRoute(const HomePage(), settings: settings);
    case AppRoutes.article:
      return buildRoute(const ArticlePage(), settings: settings);
    case AppRoutes.bookAppointment:
      return buildRoute(const BookAppointment(), settings: settings);
    case AppRoutes.login:
      return buildRoute(const LoginPage(), settings: settings);
    case AppRoutes.myRecords:
      return buildRoute(const MyRecords(), settings: settings);
    case AppRoutes.prescription:
      return buildRoute(const Prescription(), settings: settings);
    case AppRoutes.uploadDoc:
      return buildRoute(const UploadDoc(), settings: settings);
    default:
      return buildRoute(const SplashScreen(), settings: settings);
  }
}

MaterialPageRoute buildRoute(Widget child, {RouteSettings? settings}) =>
    MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) => child,
    );
