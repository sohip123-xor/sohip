import 'package:flutter/material.dart';
import 'entities.dart';



class ReportPage extends StatelessWidget {
  const ReportPage({super.key});
  @override
  Widget build(BuildContext context) {
    final ScanResult r = ModalRoute.of(context)!.settings.arguments as ScanResult;
    Color badge(int s)=> s>=80?Colors.green : s>=50?Colors.amber : Colors.red;
