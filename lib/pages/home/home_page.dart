import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:max_checkin/components/pending_checkin.dart';
import 'package:max_checkin/components/statistics.dart';
import 'package:max_checkin/global.dart';
import 'package:max_checkin/pages/home/home_page_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart';
import '../../components/recent_checkin.dart';
import '../auth/auth_viewmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthViewModel>(builder: (context, auth, child) {
      late final viewModel = Provider.of<HomeViewModel>(context, listen: true);

      return Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Color.fromARGB(255, 255, 253, 235),
                  Color.fromARGB(255, 255, 250, 208),
                  Color.fromARGB(255, 252, 238, 118)
                ],
              ),
            ),
            child: ListView(
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          width: 30.w,
                          height: 30.h,
                          // padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.yellow,
                              border:
                                  Border.all(color: Colors.white, width: .3.w)),
                          child: const Center(
                            child: Badge(
                              child: FaIcon(
                                FontAwesomeIcons.bell,
                                color: Colors.black,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 60.h,
                                width: 60.w,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(noProfilePic),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  color: Colors.yellow.shade400,
                                ),
                              ),
                              SizedBox(
                                width: 10.w,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    auth.greeting,
                                    style: GoogleFonts.nunitoSans(
                                        fontSize: 10.sp, color: Colors.black),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Text(
                                    auth.username.toUpperCase(),
                                    style: GoogleFonts.nunitoSans(
                                        fontSize: 16.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              padding: EdgeInsets.all(10.sp),
                              decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  width: .5.w,
                                  color: Colors.yellow,
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  topLeft: Radius.circular(10),
                                ),
                                color: Colors.transparent,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Total Vehicles",
                                    style: GoogleFonts.nunitoSans(
                                      fontSize: 10.sp,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Text(
                                    viewModel.vehicles.length.toString(),
                                    style: GoogleFonts.nunitoSans(
                                        fontSize: 14.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              )),
                          Container(
                              padding: EdgeInsets.all(10.sp),
                              decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  width: .5.w,
                                  color: Colors.yellow,
                                ),
                                color: Colors.transparent,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Checked-In Vehicles",
                                    style: GoogleFonts.nunitoSans(
                                      fontSize: 10.sp,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Text(
                                    viewModel.checkedVehicles.length.toString(),
                                    style: GoogleFonts.nunitoSans(
                                        fontSize: 14.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              )),
                          Container(
                              padding: EdgeInsets.all(10.sp),
                              decoration: BoxDecoration(
                                // borderRadius: BorderRadius.circular(50),
                                border: Border.all(
                                  width: .5.w,
                                  color: Colors.yellow,
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                color: Colors.transparent,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    "Available Vehicles",
                                    style: GoogleFonts.nunitoSans(
                                      fontSize: 10.sp,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  Text(
                                    viewModel.unCheckedVehicles.length
                                        .toString(),
                                    style: GoogleFonts.nunitoSans(
                                        fontSize: 14.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              )),
                        ],
                      ),
                      SizedBox(height: 24.0),
                      buildRecentCheckInsSection(context),
                      SizedBox(height: 24.0),
                      buildPendingCheckInsSection(context)
                    ],
                  ),
                ),
              ],
            ),
          ));
    });
  }
}
