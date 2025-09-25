import 'entities.dart';

// مؤقت: يرجع قائمة فارغة. ربط Shodan أو API آخر لاحقًا.
class PortApiClient {
  Future<List<PortFinding>> fetchOpenPorts(String host) async {
    // إذا أردت: نفّذ استدعاء Shodan/VirusTotal هنا
    return [];
  }
}