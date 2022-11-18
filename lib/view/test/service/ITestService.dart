// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';
import '../model/test_model.dart';

abstract class ITestService {
  final INetworkManager manager;
  final GlobalKey<ScaffoldState> scaffoldKey;

  ITestService(this.manager, this.scaffoldKey);

  Future<List<TestModel>?> fetchUserList();
}
