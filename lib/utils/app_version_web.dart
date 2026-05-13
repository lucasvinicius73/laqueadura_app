import 'dart:convert';
import 'dart:js_interop';
import 'package:web/web.dart' as web;

/// Lê a versão diretamente do version.json gerado pelo flutter build web.
Future<String> getAppVersion() async {
  try {
    final response = await web.window.fetch('version.json'.toJS).toDart;
    final jsText = await (response).text().toDart;
    final text = jsText.toDart;
    final data = json.decode(text) as Map<String, dynamic>;
    final version = data['version'] ?? '';
    final build = data['build_number'] ?? '';
    return 'v$version+$build';
  } catch (_) {
    return '';
  }
}
