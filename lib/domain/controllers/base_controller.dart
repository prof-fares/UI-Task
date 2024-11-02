import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_ui_challenge/data/models/car_model.dart';
import 'package:task_ui_challenge/presentation/resourceManger/commonWidgets/custom_snackBar.dart';

abstract class BaseController extends GetxController {
  final ScrollController scrollController = ScrollController();
  RxList<Car> cars = <Car>[].obs;
  RxBool hasMoreData = true.obs;
  RxBool isFetching = false.obs;
  int currentPage = 1;
  bool loader = false;

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(scrollListener);
    initializeData();
  }

  Future<void> loadMoreData();

  void scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent * 0.8 &&
        !isFetching.value && hasMoreData.value) {
      loadMoreData();
    }
  }

  void initializeData() {}

   void handleError(String message) {
    showError(message);
    loader =false;
    update();
  }

  // في الاختبار، يمكنك تجاوز هذه الدالة لعدم استخدام Snackbar
  void showError(String message) {
    showCustomSnackBar(message: message, isErr: true); // استخدم Snackbar فقط في التطبيق
  }

  @override
  void onClose() {
    scrollController.dispose();
    cars.clear();
    super.onClose();
  }
}
