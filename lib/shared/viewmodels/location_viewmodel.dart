// import 'dart:convert';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:http/http.dart' as http;
// import 'package:nearhere/shared/models/location.dart';

// final locationProvider = FutureProvider<String>((ref)
// async {
//   final position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
//   final lat = position.latitude;
//   final lon = position.longitude;

//   final headerss = {
//     'X-NCP-APIGW-API-KEY-ID': '',
//     'X-NCP-APIGW-API-KEY': '',
//   };

//   final response = await http.get(
//     Uri.parse(
//       "https://naveropenapi.apigw.ntruss.com/map-reversegeocode/v2/gc?request=coordsToaddr&coords=${lon},${lat}&sourcecrs=epsg:4326&output=json"),
//     headers: headerss,
//     );

//     final jsonData = response.body;
//     final myJsonGu = jsonDecode(jsonData)["results"][1]['region']['area2']['name'];
//     final myJsonSi = jsonDecode(jsonData)["results"][1]['region']['area1']['name'];

//       final address = '$myJsonSi $myJsonGu';
//       return Location(
//         latitude: lat,
//         longitude: lon,
//         address: address,
//       );
//   })

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nearhere/shared/models/location.dart';
import 'package:nearhere/shared/services/location_service.dart';

final locationProvider = FutureProvider<Location>((ref) async {
  final locationService = LocationService();
  return await locationService.getCurrentLocation();
});
