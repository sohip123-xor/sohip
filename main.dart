import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'scan_page.dart';
import 'report_page.dart';
import 'history_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<String>('scan_results'); // store JSON strings
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vuln Scanner',
      theme: ThemeData(primarySwatch: Colors.indigo),
      routes: {
        '/': (ctx) => const ScanPage(),
        '/report': (ctx) => const ReportPage(),
        '/history': (ctx) => const HistoryPage(),
      },
      initialRoute: '/',
    );
  }
}

