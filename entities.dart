class ScanTarget {
  final String originalInput;
  final Uri uri;
  ScanTarget(this.originalInput, this.uri);
}

class HeaderFindings {
  final bool hasCSP;
  final bool hasXFO;
  final bool hasHSTS;
  final bool hasXCTO;
  final Map<String, String> raw;
  HeaderFindings({required this.hasCSP, required this.hasXFO, required this.hasHSTS, required this.hasXCTO, required this.raw});
  Map<String,dynamic> toJson() => {
    'hasCSP': hasCSP, 'hasXFO': hasXFO, 'hasHSTS': hasHSTS, 'hasXCTO': hasXCTO, 'raw': raw
  };
  factory HeaderFindings.fromJson(Map<String,dynamic> j) => HeaderFindings(
      hasCSP: j['hasCSP']??false,
      hasXFO: j['hasXFO']??false,
      hasHSTS: j['hasHSTS']??false,
      hasXCTO: j['hasXCTO']??false,
      raw: Map<String,String>.from(j['raw']??{})
  );
}

class TlsFindings {
  final bool isHttps;
  final bool handshakeOk;
  final String? tlsVersion;
  final bool certValidLikely;
  TlsFindings({required this.isHttps, required this.handshakeOk, this.tlsVersion, required this.certValidLikely});
  Map<String,dynamic> toJson()=>{
    'isHttps': isHttps, 'handshakeOk': handshakeOk, 'tlsVersion': tlsVersion, 'certValidLikely': certValidLikely
  };
  factory TlsFindings.fromJson(Map<String,dynamic> j) => TlsFindings(
      isHttps: j['isHttps']??false,
      handshakeOk: j['handshakeOk']??false,
      tlsVersion: j['tlsVersion'],
      certValidLikely: j['certValidLikely']??false
  );
}

class PortFinding {
  final int port;
  final String service;
  final bool risky;
  PortFinding(this.port, this.service, this.risky);
  Map<String,dynamic> toJson()=>{'port':port,'service':service,'risky':risky};
  factory PortFinding.fromJson(Map<String,dynamic> j) => PortFinding(j['port'], j['service'], j['risky']);
}

class ScanResult {
  final String id;
  final DateTime at;
  final ScanTarget target;
  final HeaderFindings headers;
  final TlsFindings tls;
  final List<PortFinding> ports;
  final int score;
  final List<String> recommendations;

  ScanResult({required this.id, required this.at, required this.target, required this.headers, required this.tls, required this.ports, required this.score, required this.recommendations});

  Map<String,dynamic> toJson() => {
    'id': id,
    'at': at.toUtc().toIso8601String(),
    'target': {'original': target.originalInput, 'uri': target.uri.toString()},
    'headers': headers.toJson(),
    'tls': tls.toJson(),
    'ports': ports.map((p)=>p.toJson()).toList(),
    'score': score,
    'recommendations': recommendations
  };

  factory ScanResult.fromJson(Map<String,dynamic> j){
    final tgt = j['target'] ?? {};
    return ScanResult(
        id: j['id'],
        at: DateTime.parse(j['at']),
        target: ScanTarget(tgt['original'] ?? tgt['uri'] ?? '', Uri.parse(tgt['uri'] ?? tgt['original'] ?? '')),
        headers: HeaderFindings.fromJson(Map<String,dynamic>.from(j['headers'] ?? {})),
        tls: TlsFindings.fromJson(Map<String,dynamic>.from(j['tls'] ?? {})),
        ports: (j['ports'] as List<dynamic>? ?? []).map((e)=>PortFinding.fromJson(Map<String,dynamic>.from(e))).toList(),
        score: j['score'] ?? 0,
        recommendations: List<String>.from(j['recommendations'] ?? [])
    );
  }
}



sohip