import 'package:package_info_plus/package_info_plus.dart';

/// Lê a versão via package_info_plus (Android, iOS, Desktop).
Future<String> getAppVersion() async {
  try {
    final info = await PackageInfo.fromPlatform();
    return 'v${info.version}+${info.buildNumber}';
  } catch (_) {
    return '';
  }
}
