import 'package:uuid/uuid.dart';
import 'entities.dart';
import 'http_header_checker.dart';
import 'tls_checker.dart';
import 'port_api_client.dart';
import 'score_calculator.dart';

class ScanUseCase {
  final _headers = HttpHeaderChecker();
  final _tls = TlsChecker();
  final _ports = PortApiClient();
  final _score = ScoreCalculator();

  Future<ScanResult> run(String inputUrl) async {
    final normalized = _normalize(inputUrl);
    final headersMap = await _headers.getHeaders(normalized);
    final headerFindings = HeaderFindings(
        hasCSP: headersMap.containsKey('content-security-policy'),
        hasXFO: headersMap.containsKey('x-frame-options'),
        hasHSTS: headersMap.containsKey('strict-transport-security'),
        hasXCTO: headersMap.containsKey('x-content-type-options'),
        raw: headersMap
    );
    final tlsFindings = await _tls.check(normalized);
    final ports = await _ports.fetchOpenPorts(normalized.host);
    final score = _score.calculate(headerFindings, tlsFindings, ports);
    final rec = _score.recommendations(headerFindings, tlsFindings, ports);

    return ScanResult(
      id: const Uuid().v4(),
      at: DateTime.now().toUtc(),
    