import 'dart:io' as io;

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _userAgentType = 'DartServiceClient';

@injectable
class ListHeaderBuilder {
  final SharedPreferences preferences;
  ListHeaderBuilder(this.preferences);
  Map<String, dynamic> buildHeaders() {
    String uAgent = preferences.getString('UAgent');

    if (uAgent == null) {
      final os = io.Platform.operatingSystem;
      final osVersion = io.Platform.operatingSystemVersion;
      final runtimeVersion = io.Platform.version;
      uAgent = '$_userAgentType($os $osVersion $runtimeVersion)';
    }

    return {
      'User-Agent': uAgent,
    };
  }
}
