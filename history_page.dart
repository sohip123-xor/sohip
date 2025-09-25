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

