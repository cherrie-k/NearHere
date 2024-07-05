import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:nearhere/app_router.dart';
import 'package:nearhere/features/home/views/home_page.dart';
import 'package:nearhere/shared/viewmodels/location_viewmodel.dart';

Future<void> main() async {
  await _initialize();
  runApp(ProviderScope(child: MyApp()));
}

Future<void> _initialize() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await dotenv.load(fileName: '.env');
    debugPrint('Loaded .env file: ${dotenv.env}');
  } catch (e) {
    debugPrint("Could not load .env file: $e");
  }
  await NaverMapSdk.instance.initialize(
    clientId: dotenv.env['NAVER_MAP_API_ID']!,
    onAuthFailed: (ex) {
      debugPrint("********* 네이버맵 인증오류 : $ex *********");
    },
  );
  await Geolocator.checkPermission();
  await Geolocator.requestPermission();
  final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best);
  print('&&&&&&&&&&&&&');
  print('lat: ${position.latitude}');
  print('lon: ${position.longitude}');
}

class MyApp extends ConsumerWidget {
  MyApp({super.key});

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationAsyncValue = ref.watch(locationProvider);

    return MaterialApp(
      title: 'NEARHERE',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: locationAsyncValue.when(
        data: (location) {
          return MaterialApp.router(
            title: 'NEARHERE',
            routerConfig: _appRouter.router(
                location.adminAddress), // Pass location address to the router
            debugShowCheckedModeBanner: false,
            // theme: ThemeData(),
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Text('Error: $error'),
        ),
      ),
    );
  }
}
