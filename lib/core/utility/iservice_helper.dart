import 'package:boilerplate/core/constants/app/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:vexana/vexana.dart';
import '../constants/enums/snackbar_enum.dart';

class IServiceHelper {
  void showErrorMessage(GlobalKey<ScaffoldState>? scaffoldKey,
      IErrorModel? errorModel, SnackBarEnums snackBar) {
    if (scaffoldKey == null || errorModel == null) return;
    ScaffoldMessenger.of(scaffoldKey.currentContext!).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: Colors.red, width: 1.5)),
        backgroundColor: ColorConstants.errorColorLight,
        content: Row(
          children: [
            Expanded(
                flex: 1,
                child: Icon(
                  Icons.info_outline,
                  color: ColorConstants.errorColorDark,
                )),
            errorModel.statusCode == 500
                ? Expanded(
                    flex: 9,
                    child: Text(
                      "Lütfen internet bağlantınızı kontrol ediliniz",
                      style: TextStyle(color: ColorConstants.errorColorDark),
                    ))
                : Expanded(
                    flex: 9,
                    child: Text(
                      errorModel.description ??
                          errorModel.statusCode.toString(),
                      style: TextStyle(color: ColorConstants.errorColorDark),
                    )),
          ],
        ),
      ),
    );
  }
}
