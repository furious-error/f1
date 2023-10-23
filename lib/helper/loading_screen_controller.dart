import 'package:flutter/foundation.dart';

typedef CloseLoadingScreen = bool Function();
typedef UpdateLoadingScreen = bool Function(String text);

@immutable
class LoadingScreencontroller {
  final CloseLoadingScreen close;
  final UpdateLoadingScreen update;

  const LoadingScreencontroller({
    required this.close,
    required this.update,
  });
}
