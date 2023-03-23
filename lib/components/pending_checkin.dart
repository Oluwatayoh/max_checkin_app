import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:max_checkin/pages/details/vehicle_details.dart';
import 'package:max_checkin/pages/home/home_page_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

Widget buildPendingCheckInsSection(BuildContext context) {
  late final viewModel = Provider.of<HomeViewModel>(context, listen: true);
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 18.0),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pending Check-Ins',
            style: GoogleFonts.nunitoSans(
                fontSize: 13.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.0),
          Container(
            height: 100.h,
            margin: EdgeInsets.only(bottom: 16),
            child: ListView.builder(
                // physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: viewModel.unCheckedVehicles.length,
                itemBuilder: ((context, index) => _buildPendingCheckInCard(
                    onTap: () => Get.to(
                        VehicleDetail(car: viewModel.unCheckedVehicles[index]),
                        transition: Transition.fade,
                        duration: Duration(milliseconds: 500)),
                    vehicleNumber:
                        viewModel.unCheckedVehicles[index].vehicleNumbers!,
                    vehicleMake: viewModel.unCheckedVehicles[index].make!,
                    image: viewModel.unCheckedVehicles[index].image!,
                    index: index,
                    context: context))),
          ),
        ],
      ),
    ),
  );
}

Widget _buildPendingCheckInCard(
    {required String vehicleNumber,
    required String vehicleMake,
    required String image,
    required int index,
    required VoidCallback onTap,
    BuildContext? context}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(
          right: index != null ? 12 : 0, left: index == 0 ? 12 : 0),
      width: 100.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.yellow,
            width: 1.0,
            style: BorderStyle.solid,
            strokeAlign: StrokeAlign.inside,
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 165, 165, 165).withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 2),
            ),
          ],
          color: Colors.white),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            height: 40.h,
            width: 40.w,
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            vehicleMake,
            style: GoogleFonts.nunitoSans(
                fontSize: 10.0, fontWeight: FontWeight.bold),
          ),
          Text(
            vehicleNumber,
            style: GoogleFonts.nunitoSans(
                fontSize: 8.sp, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    ),
  );
}
