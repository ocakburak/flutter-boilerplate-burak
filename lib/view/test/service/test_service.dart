import 'package:boilerplate/core/constants/enums/snackbar_enum.dart';
import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';
import '../../../core/constants/enums/network_route_enum.dart';
import '../model/test_model.dart';
import 'ITestService.dart';
import '../../../core/utility/iservice_helper.dart';

class TestService extends ITestService with IServiceHelper {
  TestService(INetworkManager manager, GlobalKey<ScaffoldState> scaffoldKey)
      : super(manager, scaffoldKey);

  @override
  Future<List<TestModel>?> fetchUserList() async {
    final response = await manager.send<TestModel, List<TestModel>>(
        NetworkRoutes.USER_LIST.rawValue,
        parseModel: TestModel(),
        method: RequestType.GET);
    showErrorMessage(scaffoldKey, response.error, SnackBarEnums.ERROR);
    return response.data;
  }
}
