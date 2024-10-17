import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class AddressController extends GetxController {
  var cityController = TextEditingController();
  var areaController = TextEditingController();
  var pincodeController = TextEditingController();
  var districtController = TextEditingController();
  var stateController = TextEditingController();
  var countryController = TextEditingController();
  var landmarkController = TextEditingController();


  var currentCity = "".obs;
  var currentArea = "".obs;
  var currentCountry = "".obs;
  var  currentState = "".obs;
  var currentDistrict = "".obs;
  var currentPincode = "".obs;
  var currentLandmark = "".obs;
  bool _locationPermissionDenied = false;

  final String _apiKey = 'AIzaSyBD0p1fc0VeuAQyZALTKyW12WsgsTX5qDY';

  bool get locationPermissionDenied => _locationPermissionDenied;

  void getLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      await _getCityFromCoordinates(position.latitude, position.longitude);
    } else {
      _locationPermissionDenied = true;
      update(); // Update the UI
    }
  }

  Future<void> _getCityFromCoordinates(
      double latitude, double longitude) async {
    final String url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$_apiKey';

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
    

        if (data['status'] == 'OK' && data['results'].isNotEmpty) {
          String? cityName;
          String? areaName;
          String? stateName;
          String? districtName;
          String? countryName;
          String? pinCode;

          for (var component in data['results'][0]['address_components']) {
            if (component['types'].contains('locality')) {
              cityName = component['long_name'];
            }
            if (component['types'].contains('sublocality') ||
                component['types'].contains('neighborhood')) {
              areaName = component['long_name'];
            }
             if (component['types'].contains('administrative_area_level_1')) {
              stateName = component['long_name'];
            }
            if (component['types'].contains('administrative_area_level_2')) {
              districtName = component['long_name'];
            }
            if (component['types'].contains('country')) {
              countryName = component['long_name'];
            }
            if (component['types'].contains('postal_code')) {  // Fetching pincode
              pinCode = component['long_name'];
            }
          }
         

          if (cityName != null && areaName != null) {
            currentCity.value = cityName;
            cityController.text = currentCity.value;
            currentArea.value = areaName;
            areaController.text = currentArea.value;
            update(); // Update the UI
          }
          if(countryName != null) {
            currentCountry.value = countryName;
            countryController.text = currentCountry.value;
            update();
          }
          if(stateName != null) {
            currentState.value = stateName;
            stateController.text = currentState.value;
          }
          if(districtName != null) {
            currentDistrict.value = districtName;
            districtController.text = currentDistrict.value;
          }
          if(pinCode != null) {
            currentPincode.value = pinCode;
            pincodeController.text = currentPincode.value;
          }
        }
      }
    } catch (e) {
      print("Error occurred while calling Google Geocoding API: $e");
    }
  }

  @override
  void onInit() {
    super.onInit();
    getLocation();
  }
}
