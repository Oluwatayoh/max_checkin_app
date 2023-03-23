import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:max_checkin/models/vehicle_model';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:max_checkin/pages/home/home_page.dart';

class VehicleDetail extends StatefulWidget {
  final Vehicle? car;

  VehicleDetail({@required this.car});

  @override
  _VehicleDetailState createState() => _VehicleDetailState();
}

class _VehicleDetailState extends State<VehicleDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: GestureDetector(
                          onTap: () => Get.back(),
                          child: Container(
                              width: 40.w,
                              height: 40.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                ),
                                border: Border.all(
                                  color: Color.fromARGB(255, 231, 223, 223),
                                  width: 1,
                                ),
                              ),
                              child: Icon(
                                Icons.keyboard_arrow_left,
                                color: Colors.black,
                                size: 28,
                              )),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          widget.car!.make!,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text(
                          '${widget.car!.model!}   ${widget.car!.year!}',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        child: Hero(
                          tag: widget.car!.image!,
                          child: Image.asset(
                            widget.car!.image!,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(right: 10, left: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.yellow.shade200),
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Driver Details",
                              style: GoogleFonts.nunitoSans(
                                  color: Colors.black,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                              child: Text(
                                widget.car!.owner!.name!,
                                style: GoogleFonts.nunitoSans(
                                  color: Colors.black,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                              child: Text(
                                widget.car!.owner!.email!,
                                style: GoogleFonts.nunitoSans(
                                  color: Colors.black,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                              child: Text(
                                widget.car!.owner!.phone!,
                                style: GoogleFonts.nunitoSans(
                                  color: Colors.black,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                              child: Text(
                                '${widget.car!.owner!.address!.street} ${widget.car!.owner!.address!.city} ${widget.car!.owner!.address!.state}, ${widget.car!.owner!.address!.zip}',
                                style: GoogleFonts.nunitoSans(
                                  color: Colors.black,
                                  fontSize: 12.sp,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                if (widget.car!.recentLocations!.length != 0)
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Route History",
                      style: GoogleFonts.nunitoSans(
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                if (widget.car!.recentLocations!.length != 0)
                  SizedBox(
                    // height: double.infinity,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: widget.car!.recentLocations!.length,
                      itemBuilder: ((context, index) => Column(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width / 1.2,
                                padding: EdgeInsets.all(10),
                                margin: EdgeInsets.only(bottom: 5),
                                decoration: BoxDecoration(
                                  color: Colors.grey[50],
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      overflow: TextOverflow.clip,
                                      textAlign: TextAlign.end,
                                      // textDirection: TextDirection.rtl,
                                      softWrap: true,
                                      maxLines: 1,
                                      textScaleFactor: 1,
                                      text: TextSpan(
                                        text: 'Description: ',
                                        style: GoogleFonts.nunitoSans(
                                            color: Colors.black,
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.bold),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: widget
                                                .car!
                                                .recentLocations![index]
                                                .description,
                                            style: GoogleFonts.nunitoSans(
                                                color: Colors.black,
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                    ),
                                    RichText(
                                      overflow: TextOverflow.clip,
                                      textAlign: TextAlign.end,
                                      // textDirection: TextDirection.rtl,
                                      softWrap: true,
                                      maxLines: 1,
                                      textScaleFactor: 1,
                                      text: TextSpan(
                                        text: 'Route: ',
                                        style: GoogleFonts.nunitoSans(
                                            color: Colors.black,
                                            fontSize: 10.sp,
                                            fontWeight: FontWeight.bold),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: widget
                                                .car!
                                                .recentLocations![index]
                                                .address,
                                            style: GoogleFonts.nunitoSans(
                                                color: Colors.black,
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ],
                                      ),
                                    ),
                                    RichText(
                                      overflow: TextOverflow.clip,
                                      textAlign: TextAlign.end,
                                      // textDirection: TextDirection.rtl,
                                      softWrap: true,
                                      maxLines: 1,
                                      textScaleFactor: 1,
                                      text: TextSpan(
                                        text: 'Date / Time: ',
                                        style: GoogleFonts.nunitoSans(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10.sp),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text:
                                                ' ${DateFormat.yMMMEd().add_jm().format(DateTime.parse(widget.car!.recentLocations![index].date!))}',
                                            style: GoogleFonts.nunitoSans(
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 10.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                if (widget.car!.recentLocations!.length != 0)
                  SizedBox(
                    height: 10.h,
                  ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Text(
                          "Specifications",
                          style: GoogleFonts.nunitoSans(
                              color: Colors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        height: 60.h,
                        padding: EdgeInsets.only(
                          // top: 8,
                          left: 16,
                        ),
                        margin: EdgeInsets.only(bottom: 16),
                        child: ListView(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          children: [
                            buildSpecificationCar(
                                "Vehicle Number", widget.car!.vehicleNumbers!),
                            buildSpecificationCar("Color", widget.car!.color!),
                            buildSpecificationCar(
                                "Milage", widget.car!.mileage!.toString()),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 90,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (widget.car!.isCheckedIn!)
              Flexible(
                child: Text(
                  "This vehicle ${widget.car!.make} with vehicle number ${widget.car!.vehicleNumbers} has been checked-In already on ${DateFormat.yMMMEd().add_jm().format(DateTime.parse(widget.car!.time!))}",
                  overflow: TextOverflow.clip,
                  style: GoogleFonts.nunitoSans(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 12.sp),
                ),
              ),
            if (!widget.car!.isCheckedIn!)
              Align(
                alignment: Alignment.bottomRight,
                child: GestureDetector(
                  onTap: () => Get.bottomSheet(
                    buildBottomSheet(),
                  ),
                  child: Container(
                    height: 40.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Check-In",
                        style: GoogleFonts.nunitoSans(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 12.sp),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget buildSpecificationCar(String title, String data) {
    return Container(
      // width: 120.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 16,
      ),
      margin: EdgeInsets.only(right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: GoogleFonts.nunitoSans(color: Colors.grey, fontSize: 10.0),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            data,
            style: GoogleFonts.nunitoSans(
                color: Colors.black,
                fontSize: 12.0,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget buildBottomSheet() {
    return Container(
      // width: 120.w,
      height: MediaQuery.of(context).size.height / 4,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Warning!',
            style: GoogleFonts.nunitoSans(color: Colors.grey, fontSize: 20.sp),
          ),
          SizedBox(
            height: 5.h,
          ),
          Flexible(
            child: Text(
              "Are you sure all checks has been done on this vehicle ${widget.car!.make} with vehicle number ${widget.car!.vehicleNumbers} before you proceed?",
              overflow: TextOverflow.clip,
              style: GoogleFonts.nunitoSans(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 12.sp),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () => Get.back(),
                  child: Text(
                    "Cancel",
                    style: GoogleFonts.nunitoSans(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 12.sp),
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                GestureDetector(
                  onTap: () => Get.off(HomePage()),
                  child: Container(
                    height: 30.h,
                    width: 80.w,
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Yes",
                        style: GoogleFonts.nunitoSans(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 12.sp),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
