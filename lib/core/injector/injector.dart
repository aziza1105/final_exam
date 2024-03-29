import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final serviceLocator = GetIt.I;

Future<void> setupLocator() async {
  try {
    serviceLocator.registerSingletonAsync(
          () async => await SharedPreferences.getInstance(),
    );
  } catch (e) {
    print('Failed to initialize SharedPreferences: $e');
  }
}
