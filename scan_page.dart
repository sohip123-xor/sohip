import 'package:flutter/material.dart';
import 'scan_usecase.dart';
import 'entities.dart';
import '/hive_repo.dart';

class ScanPage extends StatefulWidget {
  const ScanPage({super.key});
  @override State<ScanPage> createState()=> _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  final _c = TextEditingController(text: 'https://example.com');
  final _usecase = ScanUseCase();
  final _repo = HiveRepo();
  bool _loading = false;
  String _lastSummary = '';
