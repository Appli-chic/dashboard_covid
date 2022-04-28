
import 'dart:io';

import 'package:flutter/foundation.dart';

bool isMobile() {
  if(kIsWeb || Platform.isWindows || Platform.isMacOS || Platform.isLinux) {
    return false;
  } else {
    return true;
  }
}
