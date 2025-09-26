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

  List<String> recommendations(HeaderFindings h, TlsFindings t, List<PortFinding> ports) {
    final rec = <String>[];
    if (!t.isHttps) rec.add("فعّل HTTPS وأجبر إعادة التوجيه من HTTP إلى HTTPS.");
    if (t.isHttps && !t.handshakeOk) rec.add("تحقق من إعدادات TLS وفرض سلسلة شهادة صحيحة.");
    if (t.isHttps && !t.certValidLikely) rec.add("جدد الشهادة أو استخدم شهادة معتمدة.");
    if (!h.hasCSP) rec.add("أضف Content-Security-Policy لتقليل خطر XSS.");
    if (!h.hasXFO) rec.add("أضف X-Frame-Options لمنع Clickjacking.");
    if (!h.hasHSTS) rec.add("فعّل HSTS لإجبار المتصفحات على استخدام HTTPS.");
    if (!h.hasXCTO) rec.add("أضف X-Content-Type-Options: nosniff.");
    if (ports.any((p)=>p.risky)) rec.add("أغلق أو قيد الوصول إلى البورتات الخاطئة.");
    return rec;
  }
}