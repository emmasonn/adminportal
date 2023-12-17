import 'package:adminportal/core/cache_manager/cache_manager.dart';
import 'package:adminportal/resources/app_strings.dart';
import 'package:flutter/material.dart';

class AppManager extends ChangeNotifier {
  AppManager() {
    getCurrentSceen();
  }

  int currentPageIndex = 0;
  bool hasShowedOnboarding = false;
  final CacheManager cacheManager = CacheManager.instance;

  //get page index
  Future<int> getCurrentSceen() async {
    return currentPageIndex;
  }

  //get onboardingStatus
  Future<bool> onBoardingStatus() async {
    final onboardStatus =
        await cacheManager.getPref(AppStrings.onboardingPrefKey) as bool?;
    if (onboardStatus != null) {
      hasShowedOnboarding = onboardStatus;
      return hasShowedOnboarding;
    }
    return false;
  }

  //update has showed onboarding
  Future<void> updateOnboardingStatus(bool condition) async {
    hasShowedOnboarding = condition;
    await cacheManager.storePref(AppStrings.onboardingPrefKey, condition);
    notifyListeners();
  }

  //switch page
  Future<void> navigateToPageIndex(int index) async {
    currentPageIndex = index;
    notifyListeners();
  }
}
