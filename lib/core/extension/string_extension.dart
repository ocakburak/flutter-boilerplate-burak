import 'package:easy_localization/easy_localization.dart';
import '../constants/app/app_contanst.dart';

extension StringLocalization on String {
  String get locale => this.tr();

  String? get isValidEmail => contains(RegExp(ApplicationConstants.emailRegex))
      ? null
      : 'Email does not valid';

  bool get isValidName => contains(RegExp(ApplicationConstants.numberRegex));

  String prefixWith(String prefix) {
    return '$prefix $this';
  }

  String get firstLetterToUpperCase {
    if (this != "") {
      return this[0].toUpperCase() + substring(1);
    } else {
      return "";
    }
  }

  bool get isValidEmails =>
      RegExp(ApplicationConstants.emailRegex).hasMatch(this);

  String get removeAllHtmlTags {
    if (this != "") {
      RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
      return replaceAll(exp, '');
    } else {
      return "";
    }
  }
}
