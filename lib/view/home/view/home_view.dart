import 'package:boilerplate/core/base/view/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/constants/navigation/navigation_constants.dart';
import '../../../core/init/navigation/navigation_service.dart';
import '../view_model/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeViewModel homeViewModel;
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (model) {
        homeViewModel = model;
      },
      onPageBuilder: (context, value) {
        return Scaffold(
          floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: (() => homeViewModel.increment())),
          appBar: AppBar(
            title: const Text("Home"),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () => value.navigateToTestView(),
                  child: const Text("Test View")),
              Center(child: Obx(() {
                return Text(homeViewModel.number.value.toString());
              })),
            ],
          ),
        );
      },
    );
  }
}
