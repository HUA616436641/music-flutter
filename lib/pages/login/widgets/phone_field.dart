import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cloud_music/pages/login/controllers/login_controller.dart';

class PhoneField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Image.asset(
          //   'assets/avatar_logo.png',
          //   width: 80,
          // ),
          // Padding(padding: EdgeInsets.symmetric(vertical: maxHeight / 50)),
          const Text(
            '登录体验更多精彩',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 48,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextField(
                controller: Get.find<LoginController>().mobileController,
                onChanged: Get.find<LoginController>().checkNextEnabled,
                style: TextStyle(color: Colors.white, fontSize: 30),
                inputFormatters: [LengthLimitingTextInputFormatter(11)],
                decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.highlight_remove,
                      size: 20,
                      color: Colors.black,
                    ),
                    // labelText: 'Email or phone number',
                    labelStyle: TextStyle(fontSize: 20, color: Colors.white60),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white38)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.white38))),
              ),
              SizedBox(height: 36),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: Obx(() {
                  return ElevatedButton(
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40))),
                      backgroundColor: MaterialStateProperty.resolveWith(
                        (states) {
                          if (states.contains(MaterialState.disabled)) {
                            return Colors.redAccent.withOpacity(0.4);
                          }
                          return Colors.red.withOpacity(0.9);
                        },
                      ),
                    ),
                    onPressed: !Get.find<LoginController>().nextEnabled.value
                        ? null
                        : Get.find<LoginController>().toCaptcha,
                    child: const Text(
                      '获取验证码',
                      style: TextStyle(fontSize: 18, letterSpacing: 2),
                    ),
                  );
                }),
              )
            ],
          ),
        ],
      ),
    );
  }
}
