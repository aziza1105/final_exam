import 'package:final_exam/core/pages/on_boarding.dart';
import 'package:final_exam/features/article/presentation/pages/articles_screen.dart';
import 'package:final_exam/features/authentication/presentation/pages/sign_up_page/sign_up.dart';
import 'package:final_exam/features/home/presentation/widgets/catalog_screen.dart';
import 'package:final_exam/features/home/presentation/widgets/home_screen.dart';
import 'package:flutter/material.dart';
import '../../features/authentication/presentation/pages/login_screen/login_screen.dart';
import '../../features/calendar/calendar_screen.dart';
import '../../features/profile/presentation/pages/profile_screen.dart';
import '../pages/splash.dart';

class RouteGenerator {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    var args = settings.arguments;

    switch (settings.name) {
      case '/home':
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );

      case '/catalog':
        return MaterialPageRoute(
          builder: (context) => CatalogScreen(),
        );
      case '/profile':
        return MaterialPageRoute(builder: (context) => const ProfileScreen());
      case '/login':
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case '/':
        return MaterialPageRoute(
          builder: (context) => const SplashPage(),
        );
      case "/onBoarding":
        return MaterialPageRoute(builder: (context) => const OnBoarding());
      case "/signUp":
        return MaterialPageRoute(builder: (context) => const SignUp());
      case "/article":
        return MaterialPageRoute(builder: (context) => const ArtclesScreen());
      case "/calendar":
        return MaterialPageRoute(builder: (context) => const CalendarScreen());

      default:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
    }
  }
}
