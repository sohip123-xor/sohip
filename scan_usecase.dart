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
      