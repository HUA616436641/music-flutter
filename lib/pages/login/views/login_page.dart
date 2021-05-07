import 'package:animations/animations.dart';
import 'package:cloud_music/pages/login/controllers/login_controller.dart';
import 'package:cloud_music/pages/login/widgets/captcha_field.dart';
import 'package:cloud_music/pages/login/widgets/phone_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                "assets/images/splash.jpg",
              ))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Obx(() => Column(
                children: <Widget>[
                  SizedBox(
                    height: 500,
                    child: PageTransitionSwitcher(
                      duration: const Duration(milliseconds: 300),
                      reverse: controller.step.value == 0,
                      transitionBuilder: (
                        Widget child,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation,
                      ) {
                        return SharedAxisTransition(
                          fillColor: Colors.transparent,
                          child: child,
                          animation: animation,
                          secondaryAnimation: secondaryAnimation,
                          transitionType: SharedAxisTransitionType.horizontal,
                        );
                      },
                      child: controller.step.value == 1
                          ? CaptchaField()
                          : PhoneField(),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
