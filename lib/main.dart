import 'package:final_exam/features/article/presentation/pages/articles_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'core/injector/injector.dart';
import 'core/routes/app_route.dart';
import 'core/widgets/save_unsave_repository.dart';
import 'features/article/presentation/articles/articles_bloc.dart';
import 'features/authentication/presentation/bloc/bloc/authentication_bloc.dart';
import 'package:final_exam/firebase_options.dart';

import 'features/home/repository/articles_repository.dart';


void main() async {


  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:
  DefaultFirebaseOptions.currentPlatform);
  await setupLocator();
  await Hive.initFlutter();
  var boxname = await Hive.openBox("name");
  var boxlocation = await Hive.openBox("location");
  var boxavatar = await Hive.openBox("avatar");
  runApp(const MainApp());
}


class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
     gestures: const [GestureType.onTap],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthenticationBloc()),

          BlocProvider<ArticlesBloc>(
            create: (context) => ArticlesBloc(
              repository: RepositoryProvider.of<ArticleRepository>(context),
              saveUnsaveRepository:
              RepositoryProvider.of<SaveUnsaveRepository>(context),
            ),

          ),




        ],
       child:  const MaterialApp(
         // theme: context.theme.lightTheme(),

          themeAnimationDuration: Duration(milliseconds: 250),
          themeAnimationCurve: Curves.slowMiddle,
          debugShowCheckedModeBanner: false,
         onGenerateRoute: RouteGenerator.onGenerateRoute,

       )
    )
        );


  }
}
