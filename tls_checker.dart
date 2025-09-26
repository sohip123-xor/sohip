import 'dart:io';
import 'entities.dart';

class TlsChecker {
  Future<TlsFindings> check(Uri uri) async {
    final isHttps = uri.scheme == 'https';
