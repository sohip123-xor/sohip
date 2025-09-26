import 'entities.dart';
import 'dart:math';

class ScoreCalculator {
  int calculate(HeaderFindings h, TlsFindings t, List<PortFinding> ports) {
    int score = 100;
    if (!t.isHttps) score -= 40;
    if (t.isHttps && !t.handshakeOk) score -= 25;
    if (t.isHttps && !t.certValidLikely) score -= 10;
    if (!h.hasCSP) score -= 10;
    if (!h.hasXFO) score -= 5;
    if (!h.hasHSTS) score -= 10;
    if (!h.hasXCTO) score -= 5;
    final riskyCount = ports.where((p)=>p.risky).length;
    score -= min(20, riskyCount * 5);
    return max(0, min(100, score));
  }
