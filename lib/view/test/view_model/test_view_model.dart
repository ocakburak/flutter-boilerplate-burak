import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/base/model/base_view_model.dart';
import '../../../core/constants/enums/page_state.dart';
import '../model/test_model.dart';
import '../service/test_service.dart';

class TestViewModel extends GetxController with BaseViewModel {
  final TestService? testService;

  TestViewModel({this.testService});

  var userList = <TestModel>[].obs;

  var pageState = PageState.LOADING.obs;

  @override
  void setContext(BuildContext context) => this.context = context;

  @override
  void init() {
    fetchUserList();
  }

  Future<void> fetchUserList() async {
    pageState.value = PageState.LOADING;
    try {
      final response = await testService!.fetchUserList();
      if (response != null) {
        userList.value = response;
      }
      pageState.value = PageState.SUCCESS;
    } catch (e) {
      pageState.value = PageState.ERROR;
    }
  }
}
