import 'package:hive_flutter/hive_flutter.dart';
import 'dart:convert';
import 'entities.dart';

class HiveRepo {
  static const boxName = 'scan_results';

  Future<void> save(ScanResult r) async {
    final box = Hive.box<String>(boxName);
    box.put(r.id, jsonEncode(r.toJson()));
