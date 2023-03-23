import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:max_checkin/global.dart';
import 'package:provider/provider.dart';

import '../../../components/custom_button.dart';
import '../../../components/text_entry.dart';
import '../auth_viewmodel.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late final viewModel = Provider.of<AuthViewModel>(context, listen: true);

    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  'assets/logo.jpeg',
                  width: 200.w,
                ),
              ),
              SizedBox(
                height: 80.h,
              ),
              Consumer<AuthViewModel>(
                builder: (context, auth, child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${auth.greeting}",
                            style: GoogleFonts.nunitoSans(
                              fontSize: 18.sp,
                            ),
                          ),
                          Text(
                            viewModel.username != ""
                                ? "${viewModel.username}"
                                : "Hello",
                            style: GoogleFonts.archivoBlack(fontSize: 25.sp),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                        ],
                      ),
                      Container(
                        height: 50.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(noProfilePic),
                              fit: BoxFit.cover,
                            ),
                            color: Colors.transparent,
                            shape: BoxShape.circle),
                      )
                    ],
                  );
                },
              ),
              TextEntryComponent(
                text: "Username",
                textColor: Colors.black,
                controller: viewModel.usernameController,
                inputType: TextInputType.name,
                onChanged: (value) => viewModel.onChange(),
                fontSize: 14.sp,
                backgroundColor: Colors.black.withOpacity(0.2),
                prefix: Container(
                  margin: EdgeInsets.only(right: 5.sp),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.sp),
                        topLeft: Radius.circular(10.sp)),
                  ),
                  child: const Icon(
                    FeatherIcons.user,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              TextEntryComponent(
                text: "Password",
                textColor: Colors.black,
                controller: viewModel.loginPassword,
                inputType: TextInputType.visiblePassword,
                obscureText: true,
                fontSize: 14.sp,
                onChanged: (value) => viewModel.onChange(),
                backgroundColor: Colors.black.withOpacity(0.2),
                prefix: Container(
                  margin: EdgeInsets.only(right: 5.sp),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10.sp),
                        topLeft: Radius.circular(10.sp)),
                  ),
                  child: const Icon(
                    FeatherIcons.lock,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomButton(
                buttonText: "Login",
                disabled: viewModel.usernameController.text.isEmpty ||
                    viewModel.loginPassword.text.isEmpty,
                radius: 10,
                fontSize: 15.sp,
                width: MediaQuery.of(context).size.width,
                onTap: () => viewModel.loginWithEmail(context),
              ),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ),
      ),
      extendBody: true,
    );
  }
}
