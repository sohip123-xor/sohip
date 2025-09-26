import 'dart:io';
import 'entities.dart';

class TlsChecker {
  Future<TlsFindings> check(Uri uri) async {
    final isHttps = uri.scheme == 'https';
    if (!isHttps) return TlsFindings(isHttps: false, handshakeOk: false, tlsVersion: null, certValidLikely: false);
    try {
      final client = HttpClient();
      client.connectionTimeout = const Duration(seconds: 8);
      final request = await client.getUrl(uri);
      final response = await request.close();
      await response.drain();
      client.close();
      return TlsFindings(isHttps: true, handshakeOk: true, tlsVersion: null, certValidLikely: true);
    } catch (_) {
      return TlsFindings(isHttps: true, handshakeOk: false, tlsVersion: null, certValidLikely: false);
    }
  }
}