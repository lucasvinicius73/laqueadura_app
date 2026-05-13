/// Exporta a implementação correta de getAppVersion() por plataforma:
/// - Web  → lê version.json via package:web (fetch API)
/// - IO   → usa package_info_plus
/// - Stub → retorna string vazia (fallback)
export 'app_version_stub.dart'
    if (dart.library.html) 'app_version_web.dart'
    if (dart.library.io) 'app_version_io.dart';
