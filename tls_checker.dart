import 'dart:io';
import 'entities.dart';

class TlsChecker {
  Future<TlsFindings> check(Uri uri) async {
    final isHttps = uri.scheme == 'https';
    if (!isHttps) return TlsFindings(isHttps: false, handshakeOk: false, tlsVersion: null, certValidLikely: false);
    try {
     