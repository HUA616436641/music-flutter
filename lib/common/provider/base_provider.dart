import 'package:cloud_music/shared/logger/logger_utils.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

abstract class BaseProvider extends GetConnect {
  @mustCallSuper
  @override
  void onInit() {
    httpClient.baseUrl = 'https://netease-cloud-music-api-murex.vercel.app';
    super.onInit();
  }

  T defaultDecoder2<T>(
      {required T Function(Map<String, dynamic>) process,
      required dynamic json}) {
    json = json as Map<String, dynamic>;
    if (json['code'] != 200) {
      final error = ResponseError(
        description: (json['msg'] ?? '') as String,
        code: json['code'],
        url: '',
      );
      Fluttertoast.showToast(
          msg: error.toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black54,
          textColor: Colors.white,
          fontSize: 16.0);

      Logger.write(error.toString(), isError: true);
      throw error;
    }
    return process(json);
  }
}

class ResponseError implements Exception {
  final String _url;
  final String _description;
  final int _code;
  ResponseError(
      {required String description, required int code, required String url})
      : _description = description,
        _url = url,
        _code = code;
  String toString() => '$_code  $_description';
}
