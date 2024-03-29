import 'package:final_exam/assets/icons.dart';
import 'package:final_exam/core/injector/injector.dart';
import 'package:final_exam/features/authentication/presentation/bloc/bloc/authentication_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state.status == AuthenticationStatus.authenticated) {
          Navigator.of(context).pushNamedAndRemoveUntil('/home', (_) => false);
        } else if (state.status == AuthenticationStatus.unauthenticated) {
          if (serviceLocator<SharedPreferences>().getBool('wizard') == true) {
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/login', (_) => false);
          } else {
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/onBoarding', (_) => false);
          }

        }
      },
      builder: (context, state) {
        if (state.status == AuthenticationStatus.unknown) {
          context
              .read<AuthenticationBloc>()
              .add(AuthenticationGetStatusEvent());
        }
        return Scaffold(
          backgroundColor: Colors.white,
          bottomNavigationBar: Container(
            padding: const EdgeInsets.all(32),
            child: const CupertinoActivityIndicator(
              radius: 16,
            ),
          ),

          body:
              Center(
                child: SvgPicture.asset(AppIcons.logo),
              ),




        );
      },
    );
  }
}
