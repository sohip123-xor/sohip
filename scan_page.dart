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
            TextField(controller: _c, decoration: const InputDecoration(labelText: 'Enter URL (e.g. example.com)')),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: _loading ? null : () async {
                setState(()=>_loading=true);
                try {
                  final ScanResult r = await _usecase.run(_c.text.trim());
                  await _repo.save(r);
                  if (!mounted) return;
                  setState(()=>_lastSummary = 'Scanned ${r.target.uri.host} — Score: ${r.score}');
                  Navigator.pushNamed(context, '/report', arguments: r);
                } catch (e) {
                  if (!mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Scan failed: $e')));
                } finally {
                