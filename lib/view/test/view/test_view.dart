import 'package:boilerplate/core/extension/future_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vexana/vexana.dart';
import '../../../core/base/view/base_widget.dart';
import '../../../core/constants/enums/page_state.dart';
import '../../../core/init/network/vexana_manager.dart';
import '../model/test_model.dart';
import '../service/ITestService.dart';
import '../service/test_service.dart';
import '../view_model/test_view_model.dart';

class TestView extends StatefulWidget {
  const TestView({Key? key}) : super(key: key);

  @override
  State<TestView> createState() => _TestViewState();
}

class _TestViewState extends State<TestView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  //Eğer future builder kullanılacaksa
  final INetworkManager manager = VexanaManager.instance.networkManager;
  ITestService get testService => TestService(manager, _scaffoldKey);
  //

  @override
  Widget build(BuildContext context) {
    return BaseView<TestViewModel>(
      viewModel: TestViewModel(
          testService:
              TestService(VexanaManager.instance.networkManager, _scaffoldKey)),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, TestViewModel value) {
        return Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: const Text("Test"),
          ),
          //Future builder kullanılacaksa
          // body: testService.fetchUserList().toBuild<List<TestModel>?>(
          //     onSuccess: (data) {
          //       return ListView.builder(
          //         itemCount: data!.length,
          //         itemBuilder: (context, index) {
          //           TestModel test = data[index];
          //           return ListTile(
          //             title: Text(test.title.toString()),
          //           );
          //         },
          //       );
          //     },
          //     loadingWidget: const Center(child: CircularProgressIndicator()),
          //     notFoundWidget: const Center(
          //       child: Text('Not Found'),
          //     ),
          //     onError: const Text('errro')),

          //Future builder kullanılmaycaksa
          body: GetX<TestViewModel>(
              init: value,
              builder: (_) {
                return value.pageState.value == PageState.LOADING
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: value.userList.length,
                        itemBuilder: (context, index) {
                          TestModel test = value.userList[index];
                          return ListTile(
                            title: Text(test.title.toString()),
                          );
                        },
                      );
              }),
        );
      },
    );
  }
}
