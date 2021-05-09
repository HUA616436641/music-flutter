import 'package:cloud_music/pages/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CaptchaField extends StatelessWidget {
  LoginController get _controller => Get.find<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 24,
            child: IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 28,
                ),
                onPressed: _controller.toMobilePage),
          ),
          SizedBox(height: 24),
          const Text(
            '输入密码',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 24),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // PinPut(
              //   fieldsCount: 4,
              //   focusNode: _controller.focusNode,
              //   withCursor: true,
              //   autofocus: true,
              //   eachFieldWidth: 50,
              //   eachFieldHeight: 60,
              //   separator: SizedBox(width: 28),
              //   fieldsAlignment: MainAxisAlignment.start,
              //   eachFieldMargin: const EdgeInsets.only(right: 20),
              //   textStyle: TextStyle(fontSize: 24, color: Colors.white),
              //   followingFieldDecoration: BoxDecoration(color: Colors.black54),
              //   selectedFieldDecoration: BoxDecoration(color: Colors.black54),
              //   submittedFieldDecoration: BoxDecoration(color: Colors.black54),
              //   onSubmit: _controller.login,
              // ),
              TextField(
                controller: Get.find<LoginController>().pwdController,
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
                child: ElevatedButton(
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
                      : Get.find<LoginController>().login,
                  child: const Text(
                    '登录',
                    style: TextStyle(fontSize: 18, letterSpacing: 2),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
