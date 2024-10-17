// address_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vav_foods_user_app/Controllers/current_location_cntr.dart';
import 'package:vav_foods_user_app/Presentation/widgets/textfield.dart';


class AddressScreen extends StatelessWidget {
  const AddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize the controller using GetX
    final AddressController controller = Get.find();

    return Scaffold(
      appBar: AppBar(title: const Text("Address Selection")),
      body:  Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Image.asset("assets/images/illustration.png"),
                    const SizedBox(height: 20),
                    const Text(
                      "Select Location",
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Switch on your location to stay in tune with what’s happening in your area",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 20),

                    // TextField for country input
                    CustomTextField(
                      controller: controller.countryController,
                      onChanged: (value) {
                        controller.currentCountry.value = value; // Update city
                      },
                    ),
                    const SizedBox(height: 10),

                    // TextField for state input
                    CustomTextField(
                      controller: controller.stateController,
                      onChanged: (value) {
                        controller.currentState.value = value; // Update area
                        
                      },
                    ),
                     // TextField for District input
                     CustomTextField(
                      controller: controller.districtController,
                      onChanged: (value) {
                        controller.currentDistrict.value = value; // Update area
                       
                      },
                    ),
                    // TextField for city input
                     CustomTextField(
                      controller: controller.cityController,
                      onChanged: (value) {
                        controller.currentCity.value = value; // Update area
                       
                      },
                    ),
                    // TextField for area input
                     CustomTextField(
                      controller: controller.areaController,
                      onChanged: (value) {
                        controller.currentArea.value = value; // Update area
                        
                      },
                    ),
                    // TextField for pincode input
                     CustomTextField(
                      controller: controller.pincodeController,
                      onChanged: (value) {
                        controller.currentPincode.value = value; // Update area
                        
                      },
                    ),
                     // TextField for landmark input
                     CustomTextField(
                      controller: controller.landmarkController,
                      onChanged: (value) {
                        controller.landmarkController.text = value; // Update area
                        
                      },
                    ),

                  ],
                ),
              ),
            ],
          ),
    );
  }
}
