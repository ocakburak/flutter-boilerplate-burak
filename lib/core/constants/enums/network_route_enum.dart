// ignore_for_file: constant_identifier_names
enum NetworkRoutes { LOGIN, USER_LIST }

extension NetwrokRoutesString on NetworkRoutes {
  String get rawValue {
    switch (this) {
      case NetworkRoutes.LOGIN:
        return 'login';
      case NetworkRoutes.USER_LIST:
        return 'posts';

      default:
        throw Exception('Routes Not Found');
    }
  }
}
