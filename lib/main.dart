import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'apis/notification_service.dart';
import 'apis/pages_router.dart';
import 'apis/theme_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await NotificationService().init(); //
  NotificationService().requestIOSPermissions(
      NotificationService().flutterLocalNotificationsPlugin);

  return runApp(ChangeNotifierProvider<ThemeNotifier>(
    create: (_) => ThemeNotifier(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, notifier, _) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: notifier.getTheme(),
          initialRoute: '/',
          onGenerateRoute: RouteGenerator.generateRoute,
        );
      },
    );
  }
}
