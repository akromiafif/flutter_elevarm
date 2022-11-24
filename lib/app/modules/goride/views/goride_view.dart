import 'package:flutter/material.dart';
import 'package:flutter_elevarm/app/data/constants.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../controllers/goride_controller.dart';

class GorideView extends GetView<GoRideController> {
  const GorideView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final GoRideController goController = Get.put(GoRideController());
    var userInfo = GetStorage().read('user-info');

    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.terrain,
            initialCameraPosition: goController.kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              goController.gMapController.complete(controller);
            },
          ),
          Positioned(
            top: 60,
            left: 20,
            right: 20,
            child: SizedBox(
              width: Get.width,
              child: Row(
                children: [
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: const Image(
                        image: AssetImage('assets/images/profile.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Good Morning, ',
                              style: GoogleFonts.lato(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                            TextSpan(
                              text: userInfo["username"],
                              style: GoogleFonts.poppins(
                                color: kPrimaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        'Where are you going?',
                        style: GoogleFonts.poppins(
                          fontSize: 24,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 140,
            left: 20,
            right: 20,
            child: Container(
              width: Get.width,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    spreadRadius: 4,
                    blurRadius: 10,
                  )
                ],
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextFormField(
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFA7A7A7),
                ),
                decoration: const InputDecoration(
                  suffixIcon: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Icon(Icons.search),
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
