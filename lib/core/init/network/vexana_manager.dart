import 'dart:io';
import 'package:vexana/vexana.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../../constants/enums/locale_keys_enum.dart';
import '../cache/locale_manager.dart';

class VexanaManager {
  static VexanaManager? _instace;
  static VexanaManager get instance {
    if (_instace != null) return _instace!;
    _instace = VexanaManager._init();
    return _instace!;
  }

  VexanaManager._init();

  INetworkManager networkManager = NetworkManager(
      isEnableLogger: false,
      options: BaseOptions(baseUrl: dotenv.env["API_URL"].toString(), headers: {
        'token':
            LocaleManager.instance.getStringValue(key: PreferencesKeys.token)
      }));
}
