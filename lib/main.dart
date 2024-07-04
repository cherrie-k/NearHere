import 'package:flutter/material.dart';
import 'package:nearhere/app_router.dart';

void main() async {
  await _initialize();
  runApp(MyApp());
}

Future<void> _initialize() async {
  WidgetsFlutterBinding.ensureInitialized();
}
class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'NEARHERE',
      routerConfig: _appRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // primarySwatch: Colors.blue,
      ),
    );
  }
}