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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vulnerability Scanner'),
        actions: [
          IconButton(onPressed: ()=> Navigator.pushNamed(context, '/history'), icon: const Icon(Icons.history))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
           