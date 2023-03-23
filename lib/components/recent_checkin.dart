import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:max_checkin/pages/details/vehicle_details.dart';
import 'package:max_checkin/pages/home/home_page_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget buildRecentCheckInsSection(BuildContext context) {
  late final viewModel = Provider.of<HomeViewModel>(context, listen: true);
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 18.0),
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent Check-Ins',
            style: GoogleFonts.nunitoSans(
                fontSize: 13.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16.0),
          Container(
            height: 180.h,
            margin: EdgeInsets.only(bottom: 16),
            child: ListView.builder(
                // physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: viewModel.checkedVehicles.length,
                itemBuilder: ((context, index) => _buildRecentCheckInCard(
                    onTap: () => Get.to(
                        VehicleDetail(car: viewModel.checkedVehicles[index]),
                        transition: Transition.fade,
                        duration: Duration(milliseconds: 500)),
                    vehicleNumber:
                        viewModel.checkedVehicles[index].vehicleNumbers!,
                    vehicleMake: viewModel.checkedVehicles[index].make!,
                    checkInTime: viewModel.checkedVehicles[index].time!,
                    ownerName: viewModel.checkedVehicles[index].owner!.name!,
                    isCheckedIn: viewModel.checkedVehicles[index].isCheckedIn!,
                    image: viewModel.checkedVehicles[index].image!,
                    index: index,
                    context: context))),
          ),
        ],
      ),
    ),
  );
}

Widget _buildRecentCheckInCard(
    {required String vehicleNumber,
    required String vehicleMake,
    required String checkInTime,
    required String ownerName,
    required String image,
    required int index,
    required bool isCheckedIn,
    required VoidCallback onTap,
    BuildContext? context}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(
          right: index != null ? 16 : 0, left: index == 0 ? 16 : 0),
      width: 200.w,
      height: 200.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 165, 165, 165).withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 2,
              offset: Offset(0, 2),
            ),
          ],
          color: Colors.yellow),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    vehicleMake,
                    style: GoogleFonts.nunitoSans(
                        fontSize: 13.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    vehicleNumber,
                    style: GoogleFonts.nunitoSans(
                      fontSize: 10.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Container(
            height: 90.h,
            child: Center(
              child: Hero(
                tag: image,
                child: Image.asset(
                  image,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                ownerName,
                style: GoogleFonts.nunitoSans(
                    fontSize: 13.0, fontWeight: FontWeight.bold),
              ),
              Text(
                '${DateFormat.yMMMd().add_jm().format(DateTime.parse(checkInTime))}',
                style: GoogleFonts.nunitoSans(
                    fontSize: 10.sp, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
