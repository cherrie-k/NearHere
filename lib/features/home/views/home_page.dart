import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nearhere/shared/viewmodels/location_viewmodel.dart';
import 'package:nearhere/shared/widgets/gradient_container.dart';
import 'package:nearhere/shared/widgets/custom_nav_bar.dart';

class HomePage extends ConsumerWidget {
  // final String location;

  const HomePage({
    super.key,
    //required this.location
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationAsyncValue = ref.watch(locationProvider);

    return Scaffold(
      body: SafeArea(
        child: locationAsyncValue.when(
          data: (location) {
            return Column(
              children: <Widget>[
                GradientContainer(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 36),
                      Text(
                        'NERE HERE!',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 34),
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('"'),
                          Text(location.adminAddress),
                          Text('"'),
                        ],
                      ),
                      SizedBox(height: 36),
                    ],
                  ),
                ),
                Expanded(
                  child: NaverMap(
                    options: NaverMapViewOptions(
                        initialCameraPosition: NCameraPosition(
                      target: NLatLng(location.latitude, location.longitude),
                      zoom: 15,
                      bearing: 0,
                      tilt: 0,
                    )),
                    onMapReady: (controller) {
                      debugPrint('네이버 맵 로딩 완료');
                    },
                  ),
                ),
              ],
            );
          },
          loading: () => Center(
            child: CircularProgressIndicator(),
          ),
          error: (error, stack) => Center(
            child: Text('Error: $error'),
          ),
        ),
      ),
    );
  }
}
