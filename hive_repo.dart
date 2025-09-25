import 'package:hive_flutter/hive_flutter.dart';
import 'dart:convert';
import 'entities.dart';

class HiveRepo {
  static const boxName = 'scan_results';

  Future<void> save(ScanResult r) async {
    final box = Hive.box<String>(boxName);
    box.put(r.id, jsonEncode(r.toJson()));
  }

  List<ScanResult> listAll() {
    final box = Hive.box<String>(boxName);
    return box.values.map((s)=> ScanResult.fromJson(jsonDecode(s))).toList()
      ..sort((a,b)=> b.at.compareTo(a.at));
  }

  ScanResult? getById(String id) {
    final box = Hive.box<String>(boxName);
    final s = box.get(id);
    if (s==null) return null;
    return ScanResult.fromJson(jsonDecode(s));
  }
}