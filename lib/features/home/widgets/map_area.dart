import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:nearhere/shared/models/location.dart';

class MapArea extends StatelessWidget {
  final Location location;

  const MapArea({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return NaverMap(
      options: NaverMapViewOptions(
        initialCameraPosition: NCameraPosition(
          target: NLatLng(location.latitude, location.longitude),
          zoom: 15,
          bearing: 0,
          tilt: 0,
        ),
      ),
      onMapReady: (controller) {
        debugPrint('네이버 맵 로딩 완료');
      },
    );
  }
}