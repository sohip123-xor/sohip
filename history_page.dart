import 'package:flutter/material.dart';
import 'hive_repo.dart';
import 'entities.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});
  @override State<HistoryPage> createState()=> _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final _repo = HiveRepo();
  List<ScanResult> _items = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  void _load(){
    _items = _repo.listAll();
    setState((){});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan History')),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (ctx,i){
          final r = _items[i];
          return ListTile(
            title: Text(r.target.uri.host),
            subtitle: Text('${r.at.toLocal()} — Score: ${r.score}'),
            trailing: const Icon(Icons.chevron_right),
            onTap: ()=> Navigator.pushNamed(context, '/report', arguments: r),
          );
        },
      ),
    );
  }
}