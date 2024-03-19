import 'dart:developer';

import 'package:flutter/material.dart';

import '../../customs/custom_loading.dart';
import '../../customs/custom_snack_bar.dart';

class HandleData {
  HandleData._();

  static final HandleData instance = HandleData._();

  failure(dynamic data, BuildContext context) {
    switch (data["key"]) {
      case 'fail':
      case 'exception':
      case 'notapproved':
      CustomLoading.dismissLoading();
      showSnackBar(data['msg'], backgroundColor: Colors.red);
      return data['msg'];
      case 'blocked':
      case 'unauthenticated':
        CustomLoading.dismissLoading();
         showSnackBar(data['msg'], backgroundColor: Colors.red);
        return data['msg'];
      case 'needActive':
        CustomLoading.dismissLoading();
         showSnackBar(data['msg'], backgroundColor: Colors.red);
        return data['msg'];
      default:
        return null;

    }
  }

  /// ********************* post Request ************************
  handlePostData(dynamic data, BuildContext context, {bool fullData = true}) {
    if (data["key"] == "success") {
      CustomLoading.dismissLoading();
      showSnackBar(data['msg']);
      log("++++++++++++++++++++++++++++++++ data ${data.toString()}");
      if (fullData) {
        return data;
      }
      return data["data"];
    } else {
      log("++++++++++++++++++++++++++++++++ failed data ${data.toString()}");
      return failure(data, context);
    }
  }

  /// ********************* get Request ************************
  handleGetData(dynamic data, BuildContext context, {bool fullData = false}) {
    if (data["key"] == "success") {
      if (fullData) {
        return data;
      }
      return data["data"];
    } else {
      log("++++++++++++++++++++++++++++++++ failed data ${data.toString()}");
      return failure(data, context);
    }
  }


}
