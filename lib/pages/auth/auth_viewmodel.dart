import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:max_checkin/pages/auth/signin/signin_view.dart';
import 'package:max_checkin/pages/home/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../common/utils.dart';
import '../../common/widgets/loader.dart';

class AuthViewModel with ChangeNotifier {
  TextEditingController loginPassword = TextEditingController();
  TextEditingController usernameController = TextEditingController();

  bool? _showPasswordReg;
  bool get showPasswordReg => _showPasswordReg!;

  String? _username;
  String get username => _username!;

  final focusNode = FocusNode();

  Timer? countdownTimer;
  Duration myDuration = Duration(minutes: 1);

  AuthViewModel() {
    _username = "";
  }

  void getStarted() {
    Get.offAll(HomePage(), transition: Transition.fade);
  }

  void onChange() {
    notifyListeners();
  }

  Future loginWithEmail(BuildContext context) async {
    Get.to(Loader());
    final prefs = await SharedPreferences.getInstance();
    String userN = "maxuser";
    String pass = "password";
    Timer(Duration(seconds: 5), () async {
      try {
        if (usernameController.text == userN && loginPassword.text == pass) {
          await prefs.setString('username', userN);
          _username = userN;
          notifyListeners();
          Get.back();
          getStarted();
        } else {
          Get.back();
          showSnackBar(
              context: context, content: "Incorrect login credentials");
        }
      } catch (e) {
        showSnackBar(context: context, content: "Error loggin in");
      }
    });
  }

  void logout() async {
    // await FirebaseAuth.instance.signOut().then((value) {
    Get.offAll(SignIn(), transition: Transition.fade);
    // });
  }

  String get greeting {
    int time = DateTime.now().hour;

    if (time < 12) {
      return 'Good Morning';
    } else if (time < 17) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }
}
