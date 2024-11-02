import 'dart:async';
import 'package:flutter/material.dart';
import 'package:task_ui_challenge/data/repos/carsRepo/cars_repo_interface.dart';
import 'package:task_ui_challenge/domain/controllers/base_controller.dart';
import 'package:task_ui_challenge/presentation/resourceManger/app_assets.dart';

class HomeController extends BaseController {
  final CarsRepoInterface dataSource;
  late PageController pageController;
  final List<String> carouselItems= [
    AppAssets.oneCar,
    AppAssets.carsGroup,
    AppAssets.oneCar,
  ];

  int currentPageIndex = 0;
  late Timer autoScrollTimer;

  HomeController({required this.dataSource});

  @override
  void initializeData() {
    super.initializeData();
    pageController = PageController(viewportFraction: 1.1);
    fetchData();
    startAutoScroll();
  }

  Future<void> fetchData() async {
    loader = true;
    update();
    final result = await dataSource.getAllCars(page: currentPage);
    result.fold(
      (error) => handleError("Error loading data"),
      (data) {
        cars.value = data.cars??[];
        loader = false;
        update();
      },
    );
  }

  @override
  Future<void> loadMoreData() async {
    if (isFetching.value || !hasMoreData.value) return;

    isFetching.value = true;
    currentPage++;
    final result = await dataSource.getAllCars(page: currentPage);
    result.fold(
      (error) => handleError("Error loading more data"),
      (data) {
        if (data.cars!.isEmpty) {
          hasMoreData.value = false;
        } else {
          cars.addAll(data.cars!);
        }
        isFetching.value = false;
      },
    );
  }

  void startAutoScroll() {
    if (carouselItems.isEmpty) return;
    autoScrollTimer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (currentPage < carouselItems.length - 1) {
        currentPage++;
      } else {
        currentPage = 0;
      }
      if (pageController.hasClients) {
        pageController.animateToPage(
          currentPage,
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInOut,
        );
      }
      update();
    });
  }

  void onPageChanged(int page) {
    currentPage = page;
    update();
  }

  @override
  void onClose() {
    autoScrollTimer.cancel();
    pageController.dispose();
    cars.clear();
    super.onClose();
  }
}
