import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nearhere/shared/viewmodels/location_viewmodel.dart';
import 'package:nearhere/shared/widgets/gradient_container.dart';

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
        child: Stack(
          children: [
            locationAsyncValue.when(
              data: (location) {
                return Column(
                  children: <Widget>[
                    GradientContainer(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(height: 46),
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
                          const SizedBox(height: 46),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Expanded(
                      child: NaverMap(
                        options: NaverMapViewOptions(
                            initialCameraPosition: NCameraPosition(
                          target:
                              NLatLng(location.latitude, location.longitude),
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
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (error, stack) => Center(
                child: Text('Error: $error'),
              ),
            ),
            Positioned(
              right: 20,
              bottom: 20,
              child: Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.2),
                      offset: Offset(0, 2),
                      blurRadius: 1.2,
                      spreadRadius: 1.2,
                    ),
                  ],
                  borderRadius: BorderRadius.circular(19),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/icons/target.svg',
                    width: 32,
                    height: 32,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
